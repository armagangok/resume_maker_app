import 'package:dartz/dartz.dart';

import '../../education_export.dart';
import '../contract/academic_data_repository.dart';

class EducationDataRepositoryImp implements EducationDataRepository {
  EducationDataRepositoryImp._();
  static final instance = EducationDataRepositoryImp._();
  @override
  Future<Either<Failure, List<EducationDataModel>?>> fetchEducationData() async {
    try {
      var response = await HiveHelper.shared.getAll<EducationDataModel>(
        HiveBoxes.academicDataBox,
      );

      if (response.isEmpty) {
        return Left(HiveNullData());
      } else {
        return Right(response);
      }
    } on Exception catch (e) {
      LogHelper.shared.errorPrint("$e");
      return Left(HiveFetchFailure());
    }
  }

  @override
  Future<void> saveEducationData(EducationDataModel academicDataModel) async {
    try {
      await HiveHelper.shared.addData<EducationDataModel>(
        HiveBoxes.academicDataBox,
        academicDataModel,
      );
    } on Exception catch (e) {
      LogHelper.shared.debugPrint("$e");
    }
  }

  @override
  Future<void> deleteData(int index) async =>
      await HiveHelper.shared.deleteDataAt<EducationDataModel>(
        HiveBoxes.academicDataBox,
        index,
      );
}
