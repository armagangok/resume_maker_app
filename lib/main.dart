import 'package:permission_handler/permission_handler.dart';

import 'app_root.dart';

import './core/export/export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var status = await Permission.storage.status;

  if (!status.isGranted) {
    await Permission.storage.request();
  }

  ScreenUtilHelper.ensureInitialized();

  initDependencies();

  await HiveHelper.shared.initializeHive();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
