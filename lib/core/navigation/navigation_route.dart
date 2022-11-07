import 'package:flutter/material.dart';
import 'package:resume_maker_app/feature/create_resume/presentation/page/create_resume.dart';
import 'package:resume_maker_app/feature/home/presentation/page/home.dart';

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
        return _getRoute(const CreateResumePage());

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
