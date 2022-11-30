// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:resume_maker_app/app_root.dart';

import 'core/export/core_export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initDependencies();
  await HiveHelper.shared.initializeHive();
  runApp(const MyApp());
}
