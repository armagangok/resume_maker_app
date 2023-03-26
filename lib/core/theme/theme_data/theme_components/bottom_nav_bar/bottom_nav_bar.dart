import 'package:google_fonts/google_fonts.dart';

import '../../../../export/export.dart';

BottomNavigationBarThemeData bottomNavBarThemeData() =>
    BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: selectedItemColor,
        size: 33.sp,
      ),
      unselectedIconTheme: IconThemeData(
        color: iconColor,
        size: 25.sp,
      ),
      selectedLabelStyle: GoogleFonts.poppins(
        color: selectedItemColor,
        fontSize: 13.sp,
      ),
      unselectedItemColor: iconColor,
      unselectedLabelStyle: GoogleFonts.poppins(
        color: selectedItemColor,
        fontSize: 13.sp,
      ),
      selectedItemColor: selectedItemColor,
    );
