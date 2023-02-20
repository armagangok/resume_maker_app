import 'dart:typed_data';

abstract class ResumeTemplateContract {
  late final String templateName;

  Future<Uint8List> createPdf();
  Future<void> savePdfFile(
    String fileName,
    Uint8List byteList,
  );
}
