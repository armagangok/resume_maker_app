import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

ElevatedButtonThemeData elevatedButtonThemeData() => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          color: const Color.fromARGB(255, 204, 204, 204),
          fontWeight: FontWeight.w400,
        ),
        foregroundColor: iconColor,
      ),
    );
