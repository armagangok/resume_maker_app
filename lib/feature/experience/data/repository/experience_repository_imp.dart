import 'package:dartz/dartz.dart';

import '../../../../core/export/core_export.dart';
import '../contract/experience_repository.dart';
import '../model/experience_model.dart';

class ExperienceRepoImp extends ExperienceRepository {
  ExperienceRepoImp({required HiveHelper hiveHelper}) {
    _hiveHelper = hiveHelper;
  }

  late final HiveHelper _hiveHelper;
  @override
  Future<Either<Failure, bool>> deleteData(int index) async {
    try {
      await _hiveHelper.deleteDataAt<ExperienceModel>(
        HiveBoxes.experienceDataBox,
        index,
      );
      return const Right(true);
    } on Exception {
      return Left(HiveDeletingFailure());
    }
  }

  @override
  Future<Either<Failure, List<ExperienceModel>>> fetchExperienceData() async {
    try {
      var response = await _hiveHelper.getAll<ExperienceModel>(
        HiveBoxes.experienceDataBox,
      );

      return response.isEmpty ? Left(HiveNullData()) : Right(response);
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
