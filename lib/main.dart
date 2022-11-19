import 'package:flutter/material.dart';

import 'core/local_database/hive/hive_helper.dart';
import 'core/navigation/navigation_route.dart';
import 'core/navigation/navigation_service.dart';
import 'feature/home/presentation/page/home.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  await HiveHelper.shared.initializeHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          // primary: Colors.white
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
