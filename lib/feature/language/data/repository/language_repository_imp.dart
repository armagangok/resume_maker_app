import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/util/database/local_database/hive/hive_helper.dart';
import '../../../../core/util/database/local_database/hive/hive_keys.dart';
import '../contract/language_repository.dart';
import '../model/language_model.dart';

class LanguageRepositoryImp implements LanguageRepository {
  LanguageRepositoryImp() {
    _hiveHelper = HiveHelper.shared;
  }

  late final HiveHelper _hiveHelper;
  @override
  Future<Either<Failure, bool>> deleteLanguageData(int index) async {
    try {
      await _hiveHelper.deleteDataAt<LanguageModel>(
        HiveBoxes.languageDataBox,
        index,
      );
      return const Right(true);
    } on Exception {
      return Left(HiveDeletingFailure());
    }
  }

  @override
  Future<Either<Failure, List<LanguageModel>>> fetchLanguageData() async {
    try {
      var response = await _hiveHelper.getAll<LanguageModel>(
        HiveBoxes.languageDataBox,
      );

      return response.isEmpty ? Left(HiveNullData()) : Right(response);
    } on Exception {
      return Left(HiveFetchFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveLanguageData(
      LanguageModel languageModel) async {
    try {
      await _hiveHelper.addData<LanguageModel>(
        HiveBoxes.languageDataBox,
        languageModel,
      );

      return const Right(true);
    } on Exception {
      return Left(HiveSavingFailure());
    }
  }
}
