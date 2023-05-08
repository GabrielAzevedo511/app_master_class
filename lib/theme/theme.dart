import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    primaryColor: const Color(0XFF055AA3),
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.light(
      brightness: Brightness.dark,
      primary: Color(0xFF055AA3),
      secondary: Color(0xFF172026),
      tertiary: Color(0xFFD6DFE4),
      onSurface: Color(0xFF51565A),
      background: Color(0xFFEDF4F8),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        color: Color(0xFF172026),
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w100,
        color: Color(0xFF172026),
      ),
      titleSmall: TextStyle(
        fontSize: 12,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w100,
        color: Color(0xFF172026),
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontFamily: 'Poppins',
        color: Color(0xFF51565A),
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontFamily: 'Poppins',
        color: Color(0xFF51565A),
      ),
    ),
    backgroundColor: const Color(0XFFD6DFE4),
    scaffoldBackgroundColor: const Color(0XFFD6DFE4),
    dialogBackgroundColor: const Color(0XFF383838),
    cardColor: const Color(0XFFEDF4F8),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: Color(0xFF055AA3),
      secondary: Color(0xFFEDF4F8),
      tertiary: Color(0xFF121517),
      onSurface: Color(0xFF51565A),
      background: Color(0xFF172026),
    ),
    primaryColor: const Color(0XFF055AA3),
    backgroundColor: const Color(0XFF121517),
    scaffoldBackgroundColor: const Color(0XFF121517),
    cardColor: const Color(0XFF172026),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        color: Color(0xFFEDF4F8),
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w100,
        color: Color(0xFFEDF4F8),
      ),
      titleSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w100,
        fontFamily: 'Poppins',
        color: Color(0xFFEDF4F8),
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontFamily: 'Poppins',
        color: Color(0xFF51565A),
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontFamily: 'Poppins',
        color: Color(0xFF51565A),
      ),
    ),
  );
}
