import 'package:flutter/material.dart';

import '../../feature/academic/presentation/page/academic.dart';
import '../../feature/create_resume/presentation/page/create_resume.dart';
import '../../feature/home/presentation/page/home.dart';
import '../../feature/language/presentation/page/language.dart';
import '../../feature/personal_details/presentation/page/personal_detail.dart';
import '../../feature/skills/presentation/page/skills.dart';
import 'constant/routes.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();
  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case KRoute.home:
        return _getRoute(const HomePage());

      case KRoute.createResumePage:
        return _getRoute(CreateResumePage());

      case KRoute.languagePage:
        return _getRoute(const LanguagePage());

      case KRoute.skillsPage:
        return _getRoute(const SkillsPage());

      case KRoute.personalDetailPage:
        return _getRoute(const PersonalDetailPage());

      case KRoute.academicPage:
        return _getRoute(const AcademicPage());

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Text("Not Found."),
          ),
        );
    }
  }

  PageRoute _getRoute(Widget page) =>
      MaterialPageRoute(builder: (context) => page);
}
