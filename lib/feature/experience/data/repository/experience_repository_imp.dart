import 'package:dartz/dartz.dart';

import '../../../../core/contracts/database_contract.dart';
import '../../../../core/export/core_export.dart';

import '../model/experience_model.dart';

class ExperienceRepoImp extends DatabaseContract {
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
  Future<Either<Failure, List<ExperienceModel>>> fetchData() async {
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
  Future<Either<Failure, bool>> saveData({
    required dynamic dataModel,
  }) async {
    try {
      await _hiveHelper.addData<ExperienceModel>(
        HiveBoxes.experienceDataBox,
        dataModel,
      );

      return const Right(true);
    } on Exception {
      return Left(HiveSavingFailure());
    }
  }

  @override
  Future<void> updateData({required newDataModel}) {
    // TODO: implement updateData
    throw UnimplementedError();
  }
}
