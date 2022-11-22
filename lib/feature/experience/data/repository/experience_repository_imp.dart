import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/local_database/hive/hive_helper.dart';
import '../../../../core/local_database/hive/hive_keys.dart';
import '../contract/experience_repository.dart';
import '../model/experience_model.dart';

class ExperienceRepositoryImp extends ExperienceRepository {
  ExperienceRepositoryImp() {
    _hiveHelper = HiveHelper.shared;
  }

  late final HiveHelper _hiveHelper;
  @override
  Future<Either<Failure, bool>> deleteData(int index) async {
    try {
      await _hiveHelper.deleteDataAt(HiveBoxes.experienceDataBox, index);
      return const Right(true);
    } on Exception {
      return Left(HiveDeletingFailure());
    }
  }

  @override
  Future<Either<Failure, ExperienceModel>> fetchExperienceData() async {
    try {
      var response = await _hiveHelper.getData<ExperienceModel>(
        HiveBoxes.experienceDataBox,
        HiveBoxes.experienceDataBox,
      );
      return response == null ? Left(HiveNullData()) : Right(response);
    } on Exception {
      return Left(HiveFetchFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> savePersonalData(
      ExperienceModel experienceModel) async {
    try {
      await _hiveHelper.addData<ExperienceModel>(
        HiveBoxes.experienceDataBox,
        experienceModel,
      );

      return const Right(true);
    } on Exception {
      return Left(HiveSavingFailure());
    }
  }
}
