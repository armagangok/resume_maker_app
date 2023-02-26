// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:resume_maker_app/core/export/export.dart';

class HomeUsecase {
  const HomeUsecase({
    Key? key,
    required HomeRepositoryContract homeRepository,
  })  : _homeRepository = homeRepository,
        super();

  final HomeRepositoryContract _homeRepository;

  Future<Result<List<FileSystemEntity>>> fetchFileEntityList() async {
    var response = await _homeRepository.fetchFileEntityList();

    return response;
  }
}
