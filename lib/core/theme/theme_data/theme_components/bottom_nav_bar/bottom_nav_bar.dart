import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

BottomNavigationBarThemeData bottomNavBarThemeData() =>
    BottomNavigationBarThemeData(
      selectedIconTheme: const IconThemeData(
        color: selectedItemColor,
        size: 36
      ),
      unselectedIconTheme: const IconThemeData(
        color: iconColor,
        size: 30,
      ),
      selectedLabelStyle: GoogleFonts.poppins(
        color: selectedItemColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      unselectedItemColor: iconColor,
      unselectedLabelStyle: GoogleFonts.poppins(
        color: selectedItemColor,
        fontSize: 14,
      ),
      selectedItemColor: selectedItemColor,
    );
