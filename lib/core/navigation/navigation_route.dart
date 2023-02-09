import 'package:flutter/material.dart';
import 'package:resume_maker_app/features/design/presentation/pages/design_page.dart';

import '../../features/home/presentation/pages/home_page.dart';
import 'constant/routes.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();
  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case KRoute.homePage:
        return _getRoute(const HomePage());

      case KRoute.designPage:
        return _getRoute(const DesignPage());

      // case KRoute.createResumePage:
      //   return _getRoute(const CreateResumePage());

      // case KRoute.languagePage:
      //   return _getRoute(const LanguagePage());

      // case KRoute.skillsPage:
      //   return _getRoute(const SkillsPage());

      // case KRoute.personalDetailPage:
      //   return _getRoute(const PersonalDetailPage());

      // case KRoute.academicPage:
      //   return _getRoute(const EducationPage());

      // case KRoute.referencesPage:
      //   return _getRoute(const ReferencePage());

      // case KRoute.experiencesPage:
      //   return _getRoute(const ExperiencesPage());

      // case KRoute.templatesPage:
      //   return _getRoute(const TemplatePage());

      // case KRoute.myProjectsPage:
      //   return _getRoute(const ProjectPage());

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
