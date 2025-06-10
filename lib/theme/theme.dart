import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      primaryColor: const Color(0xFF164f9c),
      primaryColorLight: const Color(0xFF62ABFF),
      cardColor: const Color(0xFF3377CF),
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 36,
            fontFamily: 'Cairo-Regular'),
        displayMedium: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 24,
            fontFamily: 'Cairo-Regular'),
        displaySmall: TextStyle(
            color: const Color(0xFFFFFFFF),
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
        bodyLarge: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 20,
            fontFamily: 'Cairo-Regular'),
      ));
}
