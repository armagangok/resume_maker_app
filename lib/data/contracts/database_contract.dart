import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';

// Base CRUD operations for repositories.
// Repositories will be extended from this DatabaseContract class.
abstract class DatabaseContract {
  Future<Either<Failure, dynamic>> fetchData<T>({
    required String boxName,
  });

  Future<Either<Failure, bool>> saveData<T>(
      {required dynamic dataModel, required String boxName});

  Future<Either<Failure, bool>> deleteData<T>(
      {required int index, required String boxName});

  Future<void> updateData<T>(
      {required dynamic newDataModel, required String boxName});
}
