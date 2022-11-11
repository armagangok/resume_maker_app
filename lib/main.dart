import 'package:flutter/material.dart';

import 'core/navigation/navigation_route.dart';
import 'core/navigation/navigation_service.dart';
import 'feature/home/presentation/page/home.dart';
import 'injection_container.dart';

void main() {
  initDependencies();
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
