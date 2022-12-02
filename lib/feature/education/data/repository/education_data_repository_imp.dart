import 'package:dartz/dartz.dart';

import '../../education_export.dart';
import '../contract/academic_data_repository.dart';

class EducationDataRepositoryImp implements EducationDataRepository {
  EducationDataRepositoryImp._();
  static final instance = EducationDataRepositoryImp._();

  @override
  Future<Either<Failure, dynamic>> fetchData() async {
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
  Future<void> deleteData(int index) async =>
      await HiveHelper.shared.deleteDataAt<EducationDataModel>(
        HiveBoxes.academicDataBox,
        index,
      );

  @override
  Future<void> updateData({required newDataModel}) {
    // TODO: implement updateData
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> saveData({required dataModel}) async {
    try {
      await HiveHelper.shared.addData<EducationDataModel>(
        HiveBoxes.academicDataBox,
        dataModel,
      );
      return const Right(true);
    } on Exception catch (e) {
      LogHelper.shared.debugPrint("$e");
      return Left(HiveSavingFailure());
    }
  }
}
