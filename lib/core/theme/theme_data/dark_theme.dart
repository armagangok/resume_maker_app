import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_maker_app/core/theme/constants/colors.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: primaryColor,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: const ColorScheme.dark(
    primary: primaryColor,
  ),
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     foregroundColor: Colors.yellow,
  //   ),
  // ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: GoogleFonts.poppins(
        fontSize: 16,
        color: const Color.fromARGB(255, 204, 204, 204),
        fontWeight: FontWeight.w400,
      ),
      foregroundColor: iconColor,
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: primaryColor,
    elevation: 0,
  ),
  iconTheme: const IconThemeData(
    color: iconColor,
  ),
  textTheme: TextTheme(
    bodySmall: GoogleFonts.poppins(
      fontSize: 12,
      color: const Color.fromARGB(255, 204, 204, 204),
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 14,
      color: const Color.fromARGB(255, 204, 204, 204),
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 16,
      color: const Color.fromARGB(255, 204, 204, 204),
      fontWeight: FontWeight.w400,
    ),
    displayLarge: GoogleFonts.poppins(
      fontSize: 52,
      color: const Color.fromARGB(255, 204, 204, 204),
      fontWeight: FontWeight.bold,
    ),
    labelLarge: GoogleFonts.poppins(
      fontSize: 15,
      height: 1.6,
      color: const Color.fromARGB(255, 204, 204, 204),
      fontWeight: FontWeight.w600,
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 24,
      color: const Color.fromARGB(255, 204, 204, 204),
      fontWeight: FontWeight.w600,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 22,
      color: const Color.fromARGB(255, 204, 204, 204),
      fontWeight: FontWeight.w800,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 15,
      color: const Color.fromARGB(255, 204, 204, 204),
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 22,
      color: const Color.fromARGB(255, 204, 204, 204),
      fontWeight: FontWeight.w600,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
  ),
);
