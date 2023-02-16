import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

BottomNavigationBarThemeData bottomNavBarThemeData() =>
    BottomNavigationBarThemeData(
      selectedIconTheme: const IconThemeData(
        color: selectedItemColor,
        size: 32
      ),
      unselectedIconTheme: const IconThemeData(
        color: iconColor,
        size: 25,
      ),
      selectedLabelStyle: GoogleFonts.poppins(
        color: selectedItemColor,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      unselectedItemColor: iconColor,
      unselectedLabelStyle: GoogleFonts.poppins(
        color: selectedItemColor,
        fontSize: 12,
      ),
      selectedItemColor: selectedItemColor,
    );
