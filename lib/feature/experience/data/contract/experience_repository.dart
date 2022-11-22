import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../model/experience_model.dart';

abstract class ExperienceRepository {
  Future<Either<Failure, ExperienceModel>> fetchExperienceData();
  Future<Either<Failure, bool>> savePersonalData(
    ExperienceModel experienceModel,
  );
  Future<Either<Failure, bool>> deleteData(int index);
}
