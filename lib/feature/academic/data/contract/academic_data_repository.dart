import 'package:dartz/dartz.dart';

import '../../academic_export.dart';

abstract class AcademicDataRepository {
  Future<Either<Failure, List<AcademicDataModel>?>> fetchAcademicData();
  Future<void> saveAcademicData(AcademicDataModel academicDataModel);
  Future<void> deleteData(int index);
}
