import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme textThemeData() => TextTheme(
      bodySmall: GoogleFonts.poppins(
        fontSize: 12.sp,
        color: const Color.fromARGB(255, 204, 204, 204),
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14.sp,
        color: const Color.fromARGB(255, 204, 204, 204),
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16.sp,
        color: const Color.fromARGB(255, 204, 204, 204),
        fontWeight: FontWeight.w400,
      ),
      displayLarge: GoogleFonts.poppins(
        fontSize: 52.sp,
        color: const Color.fromARGB(255, 204, 204, 204),
        fontWeight: FontWeight.bold,
      ),
      labelLarge: GoogleFonts.poppins(
        fontSize: 15.sp,
        color: const Color.fromARGB(255, 204, 204, 204),
        fontWeight: FontWeight.w600,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 24.sp,
        color: const Color.fromARGB(255, 204, 204, 204),
        fontWeight: FontWeight.w600,
      ),
      displaySmall: GoogleFonts.poppins(
        fontSize: 22.sp,
        color: const Color.fromARGB(255, 204, 204, 204),
        fontWeight: FontWeight.w800,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 15.sp,
        color: const Color.fromARGB(255, 204, 204, 204),
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 22.sp,
        color: const Color.fromARGB(255, 204, 204, 204),
        fontWeight: FontWeight.w600,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 20.sp,
        color: const Color.fromARGB(255, 204, 204, 204),
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 18.sp,
        color: const Color.fromARGB(255, 204, 204, 204),
        fontWeight: FontWeight.w700,
      ),
    );
