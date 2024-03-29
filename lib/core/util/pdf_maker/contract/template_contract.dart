import 'dart:typed_data';

import '../../directory_helper/directory_helper.dart';

abstract class ResumeTemplateContract {
  late final String templateName;
  bool isSelected = false;
  String filePath = "";
  Future<Uint8List> getcreatedPdfAsUint8List();
  Future<String> getFilePathToSave({required String fileName}) async {
    String path = await DirectoryHelper.createFolderInAppDocDir(
      "resume_folder",
    );
    return filePath = "$path$fileName.pdf";
  }

  void buildUpPDF();
  late final int resumeTemplateID;
}
