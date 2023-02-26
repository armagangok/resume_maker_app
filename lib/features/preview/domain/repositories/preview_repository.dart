// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import '../../../../core/export/export.dart';

class PreviewRepository {
  PreviewRepository({
    required PreviewDataSource previewDataSource,
    required ExceptionHandler exceptionHandler,
  }) {
    _previewDataSource = previewDataSource;
    _exceptionHandler = exceptionHandler;
  }

  late final PreviewDataSource _previewDataSource;
  late final ExceptionHandler _exceptionHandler;

  Future<Result<List<FileSystemEntity>>> fetchFileEntityList() async {
    try {
      var response = await _previewDataSource.fetchFileEntityList();

      return Result.success(response);
    } on CustomException catch (e) {
      return Result.failure(_exceptionHandler.handleException(e));
    }
  }
}
