import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/local_database/hive/hive_helper.dart';
import '../../../../core/local_database/hive/hive_keys.dart';
import '../../model/personal_data_model.dart';
import '../contract/personal_data_repository.dart';

class PersonalDatRepositoryImp implements PersonalDataRepository {
  PersonalDatRepositoryImp() {
    hiveHelper = HiveHelper.shared;
  }

  late final HiveHelper hiveHelper;

  @override
  Future<void> deleteData(int index) async {
    try {
      await hiveHelper.deleteData(
        HiveBoxes.personalDetailsBox,
        HiveBoxes.personalDetailsBox,
      );
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, PersonalDataModel?>> getPersonalData() async {
    try {
      var response = await hiveHelper.getData<PersonalDataModel>(
        HiveBoxes.personalDetailsBox,
        HiveBoxes.personalDetailsBox,
      );

      return Right(response);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<void> savePersonalData(PersonalDataModel personalDataModel) async {
    try {
      var response = await hiveHelper.putData<PersonalDataModel>(
        HiveBoxes.personalDetailsBox,
        HiveBoxes.personalDetailsBox,
        personalDataModel,
      );
    } on Exception {
      rethrow;
    }
  }
}
