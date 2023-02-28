import 'dart:io';

abstract class PreviewDataSourceContract {
  Future<List<FileSystemEntity>> fetchFileEntityList();
  Future<void> deleteFile();

  Future<List<String>> fetchPreviewPdfFiles();
}
