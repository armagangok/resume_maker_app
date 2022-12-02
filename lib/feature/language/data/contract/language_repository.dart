import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../core/contracts/database_contract.dart';

abstract class LanguageRepository extends DatabaseContract {
  @override
  Future<Either<Failure, dynamic>> fetchData();

  @override
  Future<Either<Failure, bool>> saveData({required dynamic dataModel});

  @override
  Future<Either<Failure, bool>> deleteData(int index);
}
