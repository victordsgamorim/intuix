import 'package:flutter/material.dart';
import 'package:quizz/gen/fonts.gen.dart';

part 'color_schemes.g.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: _appBarTheme(_lightColorScheme),
  colorScheme: _lightColorScheme,
  inputDecorationTheme: _inputDecorationThemeData(_lightColorScheme),
  textTheme: _textThemeData,
  elevatedButtonTheme: _elevatedButtonThemeData(_lightColorScheme),
  textButtonTheme: _textButtonThemeData(_lightColorScheme),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: _darkColorScheme,
  inputDecorationTheme: _inputDecorationThemeData(_darkColorScheme),
  textTheme: _textThemeData,
  elevatedButtonTheme: _elevatedButtonThemeData(_darkColorScheme),
  textButtonTheme: _textButtonThemeData(_darkColorScheme),
);

InputDecorationTheme _inputDecorationThemeData(ColorScheme scheme) {
  return InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.0),
      borderSide: const BorderSide(color: Colors.transparent),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.0),
      borderSide: BorderSide(color: scheme.onSecondaryContainer, width: 3.0),
    ),
    filled: true,
    fillColor: _lightColorScheme.onSecondary,
    suffixIconColor: _lightColorScheme.onSecondaryContainer,
    hintStyle: TextStyle(
        fontFamily: FontFamily.heyComic,
        color: _lightColorScheme.onSecondaryContainer.withOpacity(.7)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
  );
}

TextTheme get _textThemeData => const TextTheme(
      bodyLarge: TextStyle(fontFamily: FontFamily.heyComic),
      labelLarge: TextStyle(fontFamily: FontFamily.heyComic, fontSize: 18),
      bodyMedium: TextStyle(fontFamily: FontFamily.heyComic, fontSize: 16),
    );

ElevatedButtonThemeData _elevatedButtonThemeData(ColorScheme scheme) {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        overlayColor: MaterialStateProperty.resolveWith(
          (states) => scheme.onSecondaryContainer.withOpacity(.2),
        ),
        foregroundColor: MaterialStateColor.resolveWith(
            (states) => scheme.onSecondaryContainer),
        backgroundColor: MaterialStateProperty.all(scheme.onSecondary.withOpacity(.8))),
  );
}

TextButtonThemeData _textButtonThemeData(ColorScheme scheme) =>
    TextButtonThemeData(
        style: ButtonStyle(
      padding: MaterialStateProperty.resolveWith(
          (states) => const EdgeInsets.symmetric(horizontal: 24)),
      overlayColor: MaterialStateProperty.resolveWith(
        (states) => scheme.onSecondaryContainer.withOpacity(.2),
      ),
      foregroundColor: MaterialStateColor.resolveWith(
          (states) => scheme.onSecondaryContainer),
    ));

ButtonStyle get defaultTextButtonThemeData => ButtonStyle(
      padding: MaterialStateProperty.resolveWith(
          (states) => const EdgeInsets.symmetric(horizontal: 24)),
      overlayColor: MaterialStateProperty.resolveWith(
          (states) => Colors.white.withOpacity(.05)),
      foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
    );

AppBarTheme _appBarTheme(ColorScheme colorScheme) {
  return AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: colorScheme.onPrimary,
      ));
}
