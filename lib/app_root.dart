import 'package:flutter/material.dart';
import 'package:resume_maker_app/core/theme/theme_data/dark_theme.dart';


import 'core/navigation/constant/routes.dart';
import 'core/navigation/navigation_route.dart';
import 'core/navigation/navigation_service.dart';
import 'features/home/presentation/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme,
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      initialRoute: KRoute.homePage,
      home: const HomePage(),
    );
  }
}
