import 'package:dartz/dartz.dart';

import '../../../../core/export/core_export.dart';
import '../../academic_export.dart';

class AcademicDataRepositoryImp implements AcademicDataRepository {
  @override
  Future<Either<Failure, List<AcademicDataModel>?>> fetchAcademicData() async {
    try {
      var response = await HiveHelper.shared.getAll<AcademicDataModel>(
        HiveBoxes.academicDataBox,
      );

      return Right(response);
    } on Exception catch (e) {
      LogHelper.shared.errorPrint("$e");
      return Left(HiveFetchFailure());
    }
  }

  @override
  Future<void> saveAcademicData(AcademicDataModel academicDataModel) async {
    try {
      await HiveHelper.shared.addData<AcademicDataModel>(
        HiveBoxes.academicDataBox,
        academicDataModel,
      );
    } on Exception catch (e) {
      LogHelper.shared.debugPrint("$e");
    }
  }

  @override
  Future<void> deleteData(int index) async =>
      await HiveHelper.shared.deleteDataAt<AcademicDataModel>(
        HiveBoxes.academicDataBox,
        index,
      );
}
