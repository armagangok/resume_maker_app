import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../model/academic_data_model.dart';

abstract class AcademicDataRepository {
  Future<Either<Failure, List<AcademicDataModel>?>> fetchAcademicData();
  Future<void> saveAcademicData(AcademicDataModel academicDataModel);
  Future<void> deleteData(int index);
}
