import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../model/skill_model.dart';

abstract class SkillRepository {
  Future<Either<Failure, List<SkillModel>>> fetchSkillData();
  Future<Either<Failure, bool>> saveSkillData(
    SkillModel skillModelModel,
  );
  Future<Either<Failure, bool>> deleteSkillData(int index);
}
