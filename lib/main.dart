// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/export/core_export.dart';
import 'app_root.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initDependencies();
  await HiveHelper.shared.initializeHive();
  runApp(const MyApp());
}
