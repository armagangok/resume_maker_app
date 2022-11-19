import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../model/academic_data_model.dart';

abstract class AcademicDataRepository {
  Future<Either<Failure, AcademicDataModel?>> getAcademicData();
  Future<void> saveAcademicData(AcademicDataModel academicDataModel);
}
