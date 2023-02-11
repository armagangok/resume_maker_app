import 'package:flutter/material.dart';
import 'package:resume_maker_app/features/home/presentation/pages/home_page.dart';

import '../../features/design/presentation/pages/design_page.dart';
import '../../features/export/presentation/pages/export_page.dart';
import '../../features/preview/presentation/pages/preview_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/root_page/presentation/pages/root_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import 'constant/routes.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();
  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case rootPage:
        return _getRoute(const RootPage());
      case designPage:
        return _getRoute(const DesignPage());
      case exportPage:
        return _getRoute(const ExportPage());
      case previewPage:
        return _getRoute(const PreviewPage());
      case profilePage:
        return _getRoute(const ProfilePage());
      case homePage:
        return _getRoute(const HomePage());
      case splashPage:
        return _getRoute(const SplashPage());
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Not Found."),
            ),
          ),
        );
    }
  }

  PageRoute _getRoute(Widget page) =>
      MaterialPageRoute(builder: (context) => page);
}
