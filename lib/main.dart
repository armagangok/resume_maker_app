import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_root.dart';
import 'core/util/hive/hive_helper.dart';
import 'core/injection/injection_container.dart';
import 'core/util/screen_util_helper/screen_util.dart';

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
