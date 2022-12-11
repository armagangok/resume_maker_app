import 'package:dartz/dartz.dart';

import '../error/failure.dart';

// Base CRUD operations for repositories.
// Repositories will be extended from this DatabaseContract class.
abstract class DatabaseContract {
  Future<Either<Failure, dynamic>> fetchData();
  Future<Either<Failure, bool>> saveData({required dynamic dataModel});
  Future<Either<Failure, bool>> deleteData(int index);
  Future<void> updateData({required dynamic newDataModel});
}
