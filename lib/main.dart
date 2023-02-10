// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_root.dart';
import 'core/util/hive/hive_helper.dart';
import 'core/injection/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initDependencies();
  await HiveHelper.shared.initializeHive();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
