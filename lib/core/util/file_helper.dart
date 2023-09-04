import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';

import '../error/custom_failure.dart';
import '../export/export.dart';

class LauncherHelper {
  const LauncherHelper._();
  static Future<Result> launchFile(String filePath) async {
    try {
      var result = await OpenFilex.open(filePath);
      return Result.success(result.message);
    } on PlatformException catch (e) {
      return Result.failure(
        CustomFailure(message: e.message ?? "Error occured while launcinh PDF file."),
      );
    }
  }
}
