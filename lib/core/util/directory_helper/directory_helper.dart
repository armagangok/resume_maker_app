import 'dart:io';

import 'package:path_provider/path_provider.dart' as get_path;

class DirectoryHelper {
  DirectoryHelper._();

  // static Future<Directory> get applicationDocumentsDirectory async {
  //   final output = await get_path.getApplicationDocumentsDirectory();
  //   return output;
  // }

  static Future<Directory> get externalStorageDirectory async {
    final output = await get_path.getExternalStorageDirectory();
    return output ?? Directory("/data");
  }
}
