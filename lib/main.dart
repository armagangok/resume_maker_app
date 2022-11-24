import 'package:flutter/material.dart';

import 'core/export/core_export.dart';
import 'feature/home/presentation/page/home.dart';

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
