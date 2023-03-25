import 'dart:io';

import '../../core/export/export.dart';

class HomeDataSource extends HomeDataSourceContract {
  @override
  Future<List<FileSystemEntity>> fetchFileEntityList() async {
    Directory directory = await DirectoryHelper.applicationDocumentsDirectory;

    var filePathList = Directory(directory.path).listSync();

    return filePathList;
  }
}
