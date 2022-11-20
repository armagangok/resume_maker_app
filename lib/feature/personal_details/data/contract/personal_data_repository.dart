import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../model/personal_data_model.dart';

abstract class PersonalDataRepository {
  Future<Either<Failure, List<PersonalDataModel>?>> getAcademicData();
  Future<void> saveAcademicData(PersonalDataModel academicDataModel);
  Future<void> deleteData(int index);
}
