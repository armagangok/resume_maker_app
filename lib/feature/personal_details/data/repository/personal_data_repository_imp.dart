import 'package:dartz/dartz.dart';
import 'package:resume_maker_app/core/contracts/database_contract.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/util/hive/hive_helper.dart';
import '../../../../core/util/hive/hive_keys.dart';

import '../model/personal_data_model.dart';

class PersonalDataRepositoryImp implements DatabaseContract {
  static final instance = PersonalDataRepositoryImp._();
  PersonalDataRepositoryImp._() {
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
  Future<Either<Failure, PersonalDataModel>> fetchData() async {
    try {
      var response = await hiveHelper.getData<PersonalDataModel>(
        HiveBoxes.personalDataBox,
        HiveBoxes.personalDataBox,
      );

      if (response == null) {
        return Left(HiveNullData());
      } else {
        return Right(response);
      }
    } catch (e) {
      return Left(HiveFetchFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveData({required dynamic dataModel}) async {
    try {
      await hiveHelper.putData<PersonalDataModel>(
        HiveBoxes.personalDataBox,
        HiveBoxes.personalDataBox,
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
