// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import '../../../../core/export/export.dart';
import '../../../../core/result_types/result/result.dart';

class HomeRepository extends HomeRepositoryContract {
  HomeRepository({
    required HomeDataSourceContract homeDataSourceContract,
    required CustomException exceptionHandler,
  })  : _exceptionHandler = exceptionHandler,
        _homeDataSourceContract = homeDataSourceContract;

  final HomeDataSourceContract _homeDataSourceContract;
  final CustomException _exceptionHandler;

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
