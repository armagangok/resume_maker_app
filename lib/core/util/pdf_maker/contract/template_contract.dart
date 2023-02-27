import 'dart:typed_data';

import '../../directory_helper/directory_helper.dart';

abstract class ResumeTemplateContract {
  late final String templateName;
  bool isSelected = false;
  String filePath = "";
  Future<Uint8List> getcreatedPdf();
  Future<String> getFilePathToSave(String pdfID) async {
    String path = await DirectoryHelper.createFolderInAppDocDir(
      "resume_folder",
    );

    return filePath = "$path$pdfID.pdf";
  }

  void buildUpPDF();
  late final int resumeTemplateID;
}
