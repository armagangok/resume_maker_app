// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import '../../../../core/exception_handling/handler/exceptions_handler.dart';
import '../../../../core/export/export.dart';
import '../../../../core/result_types/result/result.dart';

class HomeRepository extends HomeRepositoryContract {
  HomeRepository({
    required HomeDataSourceContract homeDataSourceContract,
    required ExceptionHandler exceptionHandler,
  })  : _exceptionHandler = exceptionHandler,
        _homeDataSourceContract = homeDataSourceContract;

  final HomeDataSourceContract _homeDataSourceContract;
  final ExceptionHandler _exceptionHandler;

  @override
  Future<Result<List<FileSystemEntity>>> fetchFileEntityList() async {
    try {
      var response = await _homeDataSourceContract.fetchFileEntityList();
      return Result.success(response);
    } on Exception {
      rethrow;
    }
  }
}
