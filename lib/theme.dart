import 'package:flutter/material.dart';

final theme = ThemeData().copyWith(
  colorScheme: kColorScheme,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kColorScheme2.background,
    foregroundColor: kColorScheme2.primaryContainer,
  ),
  cardTheme: const CardTheme().copyWith(
    color: kColorScheme2.secondaryContainer,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kColorScheme2.primaryContainer,
    ),
  ),
);
final darkTheme = ThemeData.dark().copyWith(
  colorScheme: kColorScheme2,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kColorScheme2.secondary,
    foregroundColor: kColorScheme2.onSecondary,
  ),
  drawerTheme: const DrawerThemeData().copyWith(
    backgroundColor: kColorScheme2.secondary,
  ),
  cardTheme: const CardTheme().copyWith(
    color: kColorScheme2.secondaryContainer,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: kColorScheme2.primary,
      backgroundColor: kColorScheme2.onPrimary,
      elevation: 2,
      shadowColor: kColorScheme.secondary,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData().copyWith(
    backgroundColor: kColorScheme2.secondary,
    foregroundColor: kColorScheme2.onSecondary,
  ),
  textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          color: kColorScheme2.onPrimary,
          fontSize: 16,
        ),
        headlineLarge: TextStyle(
          fontWeight: FontWeight.bold,
          color: kColorScheme2.onPrimary,
        ),
        displaySmall: const TextStyle().copyWith(
          color: kColorScheme2.onPrimary,
        ),
        bodyLarge: const TextStyle().copyWith(
          fontWeight: FontWeight.bold,
          color: kColorScheme2.onSecondary,
        ),
        bodyMedium: const TextStyle().copyWith(
          fontWeight: FontWeight.bold,
          color: kColorScheme2.onPrimary,
        ),
        bodySmall: const TextStyle().copyWith(
          fontWeight: FontWeight.w400,
          color: kColorScheme2.onSecondary,
          fontSize: 14,
        ),
      ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: kColorScheme2.onBackground,
      backgroundColor: kColorScheme2.secondary,
    ),
  ),
);

final ColorScheme kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromRGBO(255, 129, 32, 1),
);
ColorScheme kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 255, 129, 32),
);

const ColorScheme kColorScheme2 = ColorScheme(
  brightness: Brightness.dark,
  primary: Color.fromRGBO(2, 20, 24, 1),
  onPrimary: Color.fromRGBO(242, 224, 179, 1),
  secondary: Color.fromRGBO(55, 55, 55, 1),
  onSecondary: Color.fromRGBO(255, 255, 255, 1),
  error: Color.fromRGBO(255, 54, 54, 1),
  onError: Color.fromRGBO(200, 193, 178, 1),
  background: Colors.black,
  onBackground: Colors.white,
  surface: Color.fromRGBO(242, 224, 179, 1),
  onSurface: Color.fromRGBO(2, 20, 24, 1),
);
