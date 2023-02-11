import 'package:flutter/material.dart';
import 'package:resume_maker_app/core/theme/theme_data/theme_components/text_fields/text_form_field.dart';

import '../constants/colors.dart';
import 'color/color.dart';
import 'theme_components/app_bar/app_bar.dart';
import 'theme_components/bottom_nav_bar/bottom_nav_bar.dart';
import 'theme_components/buttons/elevated_button.dart';
import 'theme_components/icon/icon.dart';
import 'theme_components/texts/text_theme_data.dart';

class CustomThemeData {
  CustomThemeData._();

  static ThemeData get darkTheme => ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: colorScheme(),
        bottomNavigationBarTheme: bottomNavBarThemeData(),
        elevatedButtonTheme: elevatedButtonThemeData(),
        appBarTheme: appBarThemeData(),
        iconTheme: iconThemeData(),
        textTheme: textThemeData(),
        inputDecorationTheme: inputDecoration(),
      );
}
