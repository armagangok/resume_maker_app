import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/local_database/hive/hive_helper.dart';
import '../../../../core/local_database/hive/hive_keys.dart';
import '../../../../core/util/logger.dart';
import '../../model/academic_data_model.dart';
import '../contract/academic_data_repository.dart';

class AcademicDataRepositoryImp implements AcademicDataRepository {
  @override
  Future<Either<Failure, AcademicDataModel?>> getAcademicData() async {
    try {
      var response = await HiveHelper.shared.getData<AcademicDataModel>(
        HiveBoxes.academicDataBox,
        HiveBoxes.academicDataBox,
      );

      return Right(response);
    } on Exception catch (e) {
      LogHelper.shared.errorPrint("$e");
      return Left(CacheFailure());
    }
  }

  @override
  Future<void> saveAcademicData(AcademicDataModel academicDataModel) async {
    try {
      await HiveHelper.shared.putData<AcademicDataModel>(
        HiveBoxes.academicDataBox,
        HiveBoxes.academicDataBox,
        academicDataModel,
      );
    } on Exception catch (e) {
      LogHelper.shared.debugPrint("$e");
    }
  }
}
