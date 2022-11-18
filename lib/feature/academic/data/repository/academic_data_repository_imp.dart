import 'package:dartz/dartz.dart';
import 'package:resume_maker_app/core/local_database/hive/hive_keys.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/local_database/hive/hive_helper.dart';
import '../../model/academic_data_model.dart';
import '../contract/academic_data_repository.dart';

class AcademicDataRepositoryImp implements AcademicDataRepository {
  @override
  Future<Either<Failure, AcademicDataModel>> getAcademicData() async {
    try {
      var result = await HiveHelper.shared.getData(HiveBoxes.academicDataBox, "key");

      if (result == null) {
        return Left(CacheFailure());
      }

      return result;
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<void> saveAcademicData(AcademicDataModel academicDataModel) async {
    await HiveHelper.shared
        .addData(HiveBoxes.academicDataBox, academicDataModel);
  }
}
