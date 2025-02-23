import 'package:easy_weather_app/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemesModeData {
  //Light Mode
  final ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    fontFamily: GoogleFonts.poppins().fontFamily,
    primarySwatch: Colors.blue,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: AppTextStyle.mainTitle.copyWith(
        color: Colors.black,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      iconTheme: IconThemeData(color: Colors.black),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: const Color.fromARGB(255, 226, 242, 250),
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: const Color.fromARGB(255, 147, 170, 180),
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.blueGrey, width: 2),
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
  );

  //Dark Mode
  final ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    primarySwatch: Colors.blue,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black87,
      titleTextStyle: AppTextStyle.mainTitle.copyWith(
        color: Colors.white,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      iconTheme: IconThemeData(color: Colors.amber),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: const Color.fromARGB(255, 147, 170, 180),
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.blueGrey, width: 2),
      ),
    ),
    scaffoldBackgroundColor: Colors.black87,
  );
}
