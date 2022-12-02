import 'package:dartz/dartz.dart';

import '../../../../core/contracts/database_contract.dart';
import '../../education_export.dart';

abstract class EducationDataRepository implements DatabaseContract {
  @override
  Future<void> deleteData(int index);

  @override
  Future<Either<Failure, dynamic>> fetchData();

  @override
  Future<Either<Failure, bool>> saveData({required dynamic dataModel});

  @override
  Future<void> updateData({required newDataModel});
}
