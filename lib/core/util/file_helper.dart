import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:resume_maker_app/core/error/custom_failure.dart';
import 'package:resume_maker_app/core/result_types/result/result.dart';

class LauncherHelper {
  LauncherHelper._();
  static Future<Result> launchFile(String filePath) async {
    try {
      var result = await OpenFile.open(filePath);
      return Result.success(result.message);
    } on PlatformException catch (e) {
      return Result.failure(
        CustomFailure(
            message: e.message ?? "Error occured while launcinh PDF file."),
      );
    }
  }
}
