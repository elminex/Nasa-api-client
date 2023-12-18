import 'package:go_router/go_router.dart';
import 'package:nasa_api_app/ui/mrp_page.dart';
import 'package:nasa_api_app/ui/nil_page.dart';
import './ui/home_page.dart';
import './ui/epic_page.dart';
import 'ui/page_builder.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const PageBuilder(page: HomePage()),
    ),
    GoRoute(
      path: '/epic',
      builder: (context, state) => const PageBuilder(page: EpicPage()),
    ),
    GoRoute(
      path: '/mrp',
      builder: (context, state) =>
          const PageBuilder(page: MarsRoverPhotoPage()),
    ),
    GoRoute(
      path: '/nil',
      builder: (context, state) =>
          const PageBuilder(page: NasaImageLibraryPage()),
    ),
  ],
);
