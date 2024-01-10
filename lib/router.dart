import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_api_app/bloc/apod/apod_cubit.dart';
import 'package:nasa_api_app/bloc/epic/cubit/epic_cubit.dart';
import 'package:nasa_api_app/ui/mrp_form_page.dart';
import 'package:nasa_api_app/ui/nil_page.dart';
import 'package:nasa_api_app/ui/visible_planets.dart';
import './ui/home_page.dart';
import './ui/epic_page.dart';
import 'ui/mrp_photo_page.dart';
import 'ui/page_builder.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => PageBuilder(
        page: const HomePage(),
        button: FloatingActionButton.large(
          onPressed: () => context.read<ApodCubit>().fetchRandomApod(),
          child: const Text(
            "Get random APOD",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
    GoRoute(
      path: '/epic',
      builder: (context, state) => PageBuilder(
        page: const EpicPage(),
        footerButtons: [
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () => context.read<EpicCubit>().getEnhancedImages(),
              child: const Text(
                "Enhanced colors",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
                onPressed: () => context.read<EpicCubit>().getAerosolImages(),
                child: const Text(
                  "Aerosol",
                  textAlign: TextAlign.center,
                )),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
                onPressed: () => context.read<EpicCubit>().getCloudImages(),
                child: const Text(
                  "cloud",
                  textAlign: TextAlign.center,
                )),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
                onPressed: () => context.read<EpicCubit>().getNaturalImages(),
                child: const Text(
                  "Natural colors",
                  textAlign: TextAlign.center,
                )),
          ),
        ],
      ),
    ),
    GoRoute(
        path: '/mrp',
        builder: (context, state) =>
            const PageBuilder(page: MarsRoverFormPage()),
        routes: [
          GoRoute(
              path: 'photos',
              builder: (context, state) => const MarsRoverPhotoPage())
        ]),
    GoRoute(
      path: '/nil',
      builder: (context, state) => const PageBuilder(
        page: NasaImageLibraryPage(),
      ),
    ),
    GoRoute(
      path: '/planets',
      builder: (context, state) =>
          const PageBuilder(page: VisiblePlanetsPage()),
    )
  ],
);
