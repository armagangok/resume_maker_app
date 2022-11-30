import 'package:flutter/material.dart';
import 'package:resume_maker_app/feature/cv_templates/presentation/page/cv_templates.dart';
import 'package:resume_maker_app/feature/home/presentation/page/home.dart';

import 'core/export/core_export.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 47, 52, 205),
          // or from RGB
        ),
        // primarySwatch: const Color.fromARGB(255, 17, 119, 203),
        scaffoldBackgroundColor: Colors.grey[300],
      ),
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      home: const HomePage(),
    );
  }
}
