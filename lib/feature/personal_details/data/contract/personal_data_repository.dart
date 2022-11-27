import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../model/personal_data_model.dart';

abstract class PersonalDataRepository {
  Future<Either<Failure, PersonalDataModel?>> fetchPersonalData();
  Future<Either<Failure, bool>> savePersonalData(
      PersonalDataModel academicDataModel);
  Future<Either<Failure, bool>> deleteData(int index);
}
