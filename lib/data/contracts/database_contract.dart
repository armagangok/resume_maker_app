import '../../core/result_types/result/result.dart';

// Base CRUD operations for repositories.
// Repositories will be extended from this DatabaseContract class.
abstract class DatabaseContract {
  Future<Result<dynamic>> fetchData<T>({
    required String boxName,
  });

  Future<Result<bool>> saveData<T>({
    required dynamic dataModel,
    required String boxName,
  });

  Future<Result<bool>> deleteData<T>({
    required int index,
    required String boxName,
  });

  Future<void> updateData<T>({
    required dynamic newDataModel,
    required String boxName,
    required int index,
  });
}
