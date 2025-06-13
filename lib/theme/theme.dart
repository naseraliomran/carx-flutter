import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xFF164f9c),
      primaryColorLight: const Color(0xFF62ABFF),
      cardColor: const Color(0xFF3377CF),
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 36,
            fontFamily: 'Cairo-Regular'),
        displayMedium: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 24,
            fontFamily: 'Cairo-Regular'),
        displaySmall: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 18,
            fontFamily: 'Cairo-Regular'),
        headlineSmall: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 16,
            fontFamily: 'Cairo-Regular'),
        titleSmall: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 14,
            fontFamily: 'Cairo-Regular'),
        titleLarge: TextStyle(
            color: Color(0xFFFFFBFB),
            fontSize: 12,
            fontFamily: 'Cairo-Regular'),
        bodyLarge: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 20,
            fontFamily: 'Cairo-Regular'),
      ));
}

ThemeData darkTheme() {
  return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xFF164f9c),
      primaryColorLight: const Color(0xFF0D47A1),
      cardColor: const Color(0xFF1E4C8F),
      scaffoldBackgroundColor: Colors.black,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 36,
            fontFamily: 'Cairo-Regular'),
        displayMedium: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 24,
            fontFamily: 'Cairo-Regular'),
        displaySmall: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 18,
            fontFamily: 'Cairo-Regular'),
        headlineSmall: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 16,
            fontFamily: 'Cairo-Regular'),
        titleSmall: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 14,
            fontFamily: 'Cairo-Regular'),
        titleLarge: TextStyle(
            color: Color(0xFFFFFBFB),
            fontSize: 12,
            fontFamily: 'Cairo-Regular'),
        bodyLarge: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 20,
            fontFamily: 'Cairo-Regular'),
      ));
}
