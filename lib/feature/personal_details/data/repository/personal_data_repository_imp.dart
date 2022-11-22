import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/local_database/hive/hive_helper.dart';
import '../../../../core/local_database/hive/hive_keys.dart';
import '../../model/personal_data_model.dart';
import '../contract/personal_data_repository.dart';

class PersonalDataRepositoryImp implements PersonalDataRepository {
  PersonalDataRepositoryImp() {
    hiveHelper = HiveHelper.shared;
  }

  late final HiveHelper hiveHelper;

  @override
  Future<Either<Failure, bool>> deleteData(int index) async {
    try {
      await hiveHelper.deleteData(
        HiveBoxes.personalDataBox,
        HiveBoxes.personalDataBox,
      );
      return const Right(true);
    } on Exception {
      return Left(HiveDeletingFailure());
    }
  }

  @override
  Future<Either<Failure, PersonalDataModel?>> getPersonalData() async {
    try {
      var response = await hiveHelper.getData<PersonalDataModel>(
        HiveBoxes.personalDataBox,
        HiveBoxes.personalDataBox,
      );

      return Right(response);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> savePersonalData(
      PersonalDataModel personalDataModel) async {
    try {
      await hiveHelper.putData<PersonalDataModel>(
        HiveBoxes.personalDataBox,
        HiveBoxes.personalDataBox,
        personalDataModel,
      );

      return const Right(true);
    } on Exception {
      return Left(HiveSavingFailure());
    }
  }
}
