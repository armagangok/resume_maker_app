// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app_root.dart';
import 'core/util/hive/hive_helper.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initDependencies();
  await HiveHelper.shared.initializeHive();
  runApp(const MyApp());
}
