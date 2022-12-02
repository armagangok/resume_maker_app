import 'package:dartz/dartz.dart';
import 'package:resume_maker_app/core/contracts/database_contract.dart';

import '../../../../core/error/failure.dart';
import '../model/experience_model.dart';

abstract class ExperienceRepository extends DatabaseContract {
  @override
  Future<Either<Failure, List<ExperienceModel>>> fetchData();
  @override
  Future<Either<Failure, bool>> saveData({required dynamic educationModel});
  @override
  Future<Either<Failure, bool>> deleteData(int index);
}
