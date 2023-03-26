import '../../../../export/export.dart';

BottomNavigationBarThemeData bottomNavBarThemeData() =>
    BottomNavigationBarThemeData(
      selectedIconTheme: const IconThemeData(
        color: selectedItemColor,
        size: 33,
      ),
      unselectedIconTheme: const IconThemeData(
        color: iconColor,
        size: 25,
      ),
      selectedLabelStyle: GoogleFonts.poppins(
        color: selectedItemColor,
        fontSize: 13,
      ),
      unselectedItemColor: iconColor,
      unselectedLabelStyle: GoogleFonts.poppins(
        color: selectedItemColor,
        fontSize: 13,
      ),
      selectedItemColor: selectedItemColor,
    );
