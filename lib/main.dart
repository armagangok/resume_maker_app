import 'package:flutter/material.dart';

import 'app_root.dart';

import './core/export/export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ScreenUtilHelper.ensureInitialized();

  initDependencies();

  await HiveHelper.shared.initializeHive();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
