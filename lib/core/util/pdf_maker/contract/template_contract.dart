import 'dart:typed_data';

abstract class ResumeTemplateContract {
  late final String templateName;
  bool isSelected = false;
  String filePath = "";
  Future<Uint8List> getcreatedPdf();
  Future<String> getFilePathToSave(String pdfID);
  void buildUpPDF();
  late final int resumeTemplateID;
}
