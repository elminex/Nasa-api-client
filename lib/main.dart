import 'package:flutter/material.dart';
import 'package:nasa_api_app/api/models/epic/image_type_enum.dart';
import 'package:nasa_api_app/bloc/epic/cubit/epic_cubit.dart';
import 'package:nasa_api_app/bloc/mars_rover/cubit/mars_rover_cubit.dart';
import 'package:nasa_api_app/bloc/nil/cubit/nil_cubit.dart';
import 'package:nasa_api_app/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_api_app/bloc/apod/apod_cubit.dart';
import 'package:nasa_api_app/bloc/visible_planets/cubit/visible_planets_cubit.dart';
import 'package:nasa_api_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ApodCubit()..fetchCurrentApod(),
        ),
        BlocProvider(
          create: (context) =>
              EpicCubit()..getImages(ImageTypeEnum.natural.name),
        ),
        BlocProvider(create: (context) => MarsRoverCubit()),
        BlocProvider(create: (context) => NILCubit()),
        BlocProvider(
            create: (context) => VisiblePlanetsCubit()..getVisiblePlanets()),
      ],
      child: MaterialApp.router(
        theme: theme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        title: "Nasa",
        routerConfig: router,
      ),
    );
  }
}
