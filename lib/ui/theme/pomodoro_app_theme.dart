import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class PomodoroAppTheme {
  static const Color white80 = Color(0xFFFFE1DE);
  static const Color redPrimary = Color(0xFFFF8A80);
  static const Color redBackground = Color(0xFFFFBCAF);
  static const Color redStatusBar = Color(0xFFEA968C);

  static TextTheme lightTextTheme = TextTheme(
    headline3: GoogleFonts.roboto(color: Colors.white),
    headline4: GoogleFonts.duruSans(color: Colors.white),
    caption: GoogleFonts.roboto(color: Colors.white),
    button: GoogleFonts.roboto(
      color: Colors.white,
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
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
