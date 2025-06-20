import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xFF164f9c),
      primaryColorLight: const Color(0xFF62ABFF),
      cardColor: const Color(0xFF3377CF),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Cairo-Regular',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 36,
        ),
        displayMedium: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 24,
        ),
        displaySmall: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 18,
        ),
        headlineSmall: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 16,
        ),
        titleSmall: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 14,
        ),
        titleLarge: TextStyle(
          color: Color(0xFFFFFBFB),
          fontSize: 12,
        ),
        bodyLarge: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 20,
        ),
      ));
}

ThemeData darkTheme() {
  return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xFF164f9c),
      primaryColorLight: const Color(0xFF0D47A1),
      cardColor: const Color(0xFF1E4C8F),
      scaffoldBackgroundColor: Colors.black,
      fontFamily: 'Cairo-Regular',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 36,
        ),
        displayMedium: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 24,
        ),
        displaySmall: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 18,
        ),
        headlineSmall: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 16,
        ),
        titleSmall: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 14,
        ),
        titleLarge: TextStyle(
          color: Color(0xFFFFFBFB),
          fontSize: 12,
        ),
        bodyLarge: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 20,
        ),
      ));
}
