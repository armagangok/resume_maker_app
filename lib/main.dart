import 'package:flutter/material.dart';
import 'package:resume_maker_app/core/navigation/navigation_route.dart';
import 'package:resume_maker_app/core/navigation/navigation_service.dart';

import 'feature/home/presentation/page/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      home: const HomePage(),
    );
  }
}
