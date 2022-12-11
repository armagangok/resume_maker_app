import 'package:dartz/dartz.dart';
import 'package:resume_maker_app/core/contracts/database_contract.dart';

import '../../../../../core/error/failure.dart';
import '../model/skill_model.dart';

abstract class SkillRepository implements DatabaseContract {
  @override
  Future<Either<Failure, List<SkillModel>>> fetchData();

  @override
  Future<Either<Failure, bool>> saveData({required dynamic dataModel});

  @override
  Future<Either<Failure, bool>> deleteData(int index);
}
