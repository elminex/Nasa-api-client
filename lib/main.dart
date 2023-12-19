import 'package:flutter/material.dart';
import 'package:nasa_api_app/bloc/epic/cubit/epic_cubit.dart';
import './router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/apod/apod_cubit.dart';

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
          create: (context) => EpicCubit()..getNaturalImages(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData.light(
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(
          useMaterial3: true,
        ),
        themeMode: ThemeMode.dark,
        title: "Nasa",
        routerConfig: router,
      ),
    );
  }
}
