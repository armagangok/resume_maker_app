import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/util/hive/hive_helper.dart';
import '../../../../core/util/hive/hive_keys.dart';
import '../contract/language_repository.dart';
import '../model/skill_model.dart';

class SkillRepositoryImp implements SkillRepository {
  SkillRepositoryImp() {
    _hiveHelper = HiveHelper.shared;
  }

  late final HiveHelper _hiveHelper;

  @override
  Future<Either<Failure, bool>> deleteData(int index) async {
    try {
      await _hiveHelper.deleteDataAt<SkillModel>(
        HiveBoxes.skillDataBox,
        index,
      );
      return const Right(true);
    } on Exception {
      return Left(HiveDeletingFailure());
    }
  }

  @override
  Future<Either<Failure, List<SkillModel>>> fetchData() async {
    try {
      var response = await _hiveHelper.getAll<SkillModel>(
        HiveBoxes.skillDataBox,
      );

      return response.isEmpty ? Left(HiveNullData()) : Right(response);
    } on Exception {
      return Left(HiveFetchFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveData({required dynamic dataModel}) async {
    try {
      await _hiveHelper.addData<SkillModel>(
        HiveBoxes.skillDataBox,
        dataModel,
      );

      return const Right(true);
    } on Exception {
      return Left(HiveSavingFailure());
    }
  }

  @override
  Future<void> updateData({required newDataModel}) async {}
}
