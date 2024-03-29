import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_api_app/bloc/apod/apod_cubit.dart';
import 'package:nasa_api_app/ui/mrp_form_page.dart';
import 'package:nasa_api_app/ui/news_page.dart';
import 'package:nasa_api_app/ui/nil_form_page.dart';
import 'package:nasa_api_app/ui/nil_result_page.dart';
import 'package:nasa_api_app/ui/single_news_page.dart';
import 'package:nasa_api_app/ui/visible_planets.dart';
import './ui/home_page.dart';
import 'ui/epic_page.dart';
import 'ui/mrp_photo_page.dart';
import 'ui/page_builder.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => PageBuilder(
        page: const HomePage(),
        button: FloatingActionButton.extended(
          elevation: 12,
          onPressed: () => context.read<ApodCubit>().fetchRandomApod(),
          label: const Text(
            "Get random",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
    GoRoute(
      path: '/epic',
      builder: (context, state) => const PageBuilder(
        page: EpicPage(),
      ),
    ),
    GoRoute(
        path: '/mrp',
        builder: (context, state) =>
            const PageBuilder(page: MarsRoverFormPage()),
        routes: [
          GoRoute(
            path: 'photos/:date/:rover/:cameras',
            name: 'mrp-photos',
            builder: (context, state) {
              return MarsRoverPhotoPage(
                date: state.pathParameters['date']!,
                rover: state.pathParameters['rover']!,
                cameras: state.pathParameters['cameras']!,
              );
            },
          ),
        ]),
    GoRoute(
        path: '/nil',
        builder: (context, state) => const PageBuilder(
              page: NILFormPage(),
            ),
        routes: [
          GoRoute(
            path: 'result',
            builder: (context, state) => const NILResultPage(),
          ),
        ]),
    GoRoute(
      path: '/planets',
      builder: (context, state) =>
          const PageBuilder(page: VisiblePlanetsPage()),
    ),
    GoRoute(
        path: '/news',
        builder: (context, state) => const PageBuilder(page: NewsPage()),
        routes: [
          GoRoute(
            path: 'single/:id',
            name: 'single-news',
            builder: (context, state) =>
                SingleNewsPage(articleId: state.pathParameters['id']!),
          ),
        ]),
  ],
);
