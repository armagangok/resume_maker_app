import 'dart:io';
import 'package:path_provider/path_provider.dart' as get_path;



class DirectoryHelper {
  DirectoryHelper._();

  ///   iOS: `NSDocumentsDirectory`
  ///   Android: `The AppData directory`.
  static Future<Directory> get applicationDocumentsDirectory async {
    var output = await get_path.getApplicationDocumentsDirectory();
    print(output);
    return output;
  }

  static Future<String> createFolderInAppDocDir(String folderName) async {
    //Get this App Document Directory
    final Directory appDocDir = await get_path.getApplicationDocumentsDirectory();
    //App Document Directory + folder name
    final Directory appDocDirFolder = Directory('${appDocDir.path}/$folderName/');

    if (await appDocDirFolder.exists()) {
      //if folder already exists return path
      return appDocDirFolder.path;
    } else {
      //if folder not exists create folder and then return its path
      final Directory appDocDirNewFolder = await appDocDirFolder.create(recursive: true);
      return appDocDirNewFolder.path;
    }
  }
}
