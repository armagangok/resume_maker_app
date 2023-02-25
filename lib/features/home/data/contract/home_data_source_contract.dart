import 'dart:io';

abstract class HomeDataSourceContract {
  Future<List<FileSystemEntity>> fetchFileEntityList();
}
