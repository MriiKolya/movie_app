import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/features/constant/constant.dart';

ThemeData dartTheme() => ThemeData(
    brightness: Brightness.dark,
    primaryColor: Constant.primaryColor,
    focusColor: Constant.primaryColor,
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: Colors.black),
    outlinedButtonTheme: const OutlinedButtonThemeData(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Constant.primaryColor,
          foregroundColor: Colors.white,
          textStyle:
              GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
          fixedSize: const Size(300, 50)),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Constant.primaryColor,
          foregroundColor: Colors.white,
          textStyle:
              GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
          minimumSize: const Size(300, 10),
          maximumSize: const Size(400, 50)),
    ),
    textButtonTheme: const TextButtonThemeData(),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: 24,
        color: Colors.white,
      ),
      displayMedium: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
      labelLarge: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
      labelMedium: GoogleFonts.poppins(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w200),
      labelSmall: GoogleFonts.poppins(
        fontSize: 12,
        color: Colors.white,
      ),
      displayLarge: GoogleFonts.poppins(fontSize: 24, color: Colors.white),
      headlineMedium: GoogleFonts.poppins(
          fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white),
    ),
    scaffoldBackgroundColor: Constant.backgroundColor);
