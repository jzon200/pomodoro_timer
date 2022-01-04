import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class PomodoroAppTheme {
  static const Color white80 = Color(0xFFFFE1DE);
  static const Color redPrimary = Color(0xFFFF8A80);
  static const Color redBackground = Color(0xFFFFBCAF);
  static const Color redStatusBar = Color(0xFFEA968C);

  static TextTheme lightTextTheme = TextTheme(
    headline3: GoogleFonts.roboto(color: white80),
    headline4: GoogleFonts.duruSans(color: white80),
    caption: GoogleFonts.roboto(color: white80),
    button: GoogleFonts.roboto(
      color: white80,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: redPrimary,
      backgroundColor: redBackground,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: redStatusBar),
      ),
      textTheme: lightTextTheme,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.white,
        unselectedItemColor: white80,
      ),
    );
  }
}
