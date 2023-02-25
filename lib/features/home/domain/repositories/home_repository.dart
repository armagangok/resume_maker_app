// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:resume_maker_app/core/result_types/result/result.dart';

import '../../../../core/export/export.dart';

class HomeRepository extends HomeRepositoryContract {
  HomeRepository({
    required this.homeDataSourceContract,
  });

  final HomeDataSourceContract homeDataSourceContract;

  @override
  Future<Result<List<FileSystemEntity>>> fetchFileEntityList() async {
    try {
      var response = await homeDataSourceContract.fetchFileEntityList();
      return Result.success(response);
    } catch (e) {
      rethrow;
    }
  }
}
