import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

BottomNavigationBarThemeData bottomNavBarThemeData() {
  return const BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(
      color: selectedItemColor,
    ),
    unselectedIconTheme: IconThemeData(
      color: iconColor,
    ),
    selectedLabelStyle: TextStyle(
      color: selectedItemColor,
    ),
    unselectedItemColor: iconColor,
    unselectedLabelStyle: TextStyle(
      color: selectedItemColor,
    ),
  );
}
