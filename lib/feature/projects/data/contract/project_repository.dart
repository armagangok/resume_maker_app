import 'package:dartz/dartz.dart';

import '../../../../core/contracts/database_contract.dart';
import '../../../../core/error/failure.dart';
import '../model/project_model.dart';

abstract class ProjectRepository implements DatabaseContract {
  @override
  Future<Either<Failure, List<ProjectModel>>> fetchData();
  @override
  Future<Either<Failure, bool>> saveData({required dynamic dataModel});
  @override
  Future<Either<Failure, bool>> deleteData(int index);
}
