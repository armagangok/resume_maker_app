import 'dart:io';

import '../../../../core/export/export.dart';
import '../contract/preview_data_source_contract.dart';

class PreviewDataSource extends PreviewDataSourceContract {
  @override
  Future<List<FileSystemEntity>> fetchFileEntityList() async {
    Directory directory = await DirectoryHelper.applicationDocumentsDirectory;

    var filePathList = Directory(directory.path).listSync();

    return filePathList;
  }

  @override
  Future<void> deleteFile() async {}
}
