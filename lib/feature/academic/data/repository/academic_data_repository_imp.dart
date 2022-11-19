import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/local_database/hive/hive_helper.dart';
import '../../../../core/local_database/hive/hive_keys.dart';
import '../../../../core/util/logger.dart';
import '../../model/academic_data_model.dart';
import '../contract/academic_data_repository.dart';

class AcademicDataRepositoryImp implements AcademicDataRepository {
  @override
  Future<Either<Failure, AcademicDataModel>> getAcademicData() async {
    try {
      var result = await HiveHelper.shared.getAll(HiveBoxes.academicDataBox);

      if (result is AcademicDataModel) {
        return result[0];
      } else {
        return Left(CacheFailure());
      }
    } on Exception catch (e) {
      LogHelper.shared.errorPrint("$e");
      return Left(CacheFailure());
    }
  }

  @override
  Future<void> saveAcademicData(AcademicDataModel academicDataModel) async {
    await HiveHelper.shared.clearBox(HiveBoxes.academicDataBox);
    await HiveHelper.shared.addData(
      HiveBoxes.academicDataBox,
      academicDataModel,
    );
  }
}
