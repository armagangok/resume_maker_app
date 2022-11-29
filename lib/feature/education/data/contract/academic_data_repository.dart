import 'package:dartz/dartz.dart';

import '../../education_export.dart';

abstract class EducationDataRepository {
  Future<Either<Failure, List<EducationDataModel>?>> fetchEducationData();
  Future<void> saveEducationData(EducationDataModel academicDataModel);
  Future<void> deleteData(int index);
}
