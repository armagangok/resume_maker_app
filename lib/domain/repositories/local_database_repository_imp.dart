import '../../core/error/custom_failure.dart';
import '../../core/export/export.dart';
import '../../core/util/logger.dart';

class LocalDatabaseRepositoryImp {
  LocalDatabaseRepositoryImp._();
  static final instance = LocalDatabaseRepositoryImp._();

  final HiveHelper _hiveHelper = HiveHelper.shared;

  Future<Result<dynamic>> fetchData<T>({
    required String boxName,
  }) async {
    try {
      var response = await _hiveHelper.getAll<T>(boxName);

      return Result.success(response);

      // if (response.isEmpty) {
      //   return Result.success(response);
      // } else {
      //   return Result.success(response);
      // }
    } on Exception catch (e) {
      LogHelper.shared.errorPrint("$e");
      return Result.failure(CustomFailure(message: "message"));
    }
  }

  Future<Result<bool>> deleteData<T>({
    required int index,
    required String boxName,
  }) async {
    try {
      await _hiveHelper.deleteDataAt<T>(
        boxName,
        index,
      );

      return const Result.success(true);
    } catch (e) {
      LogHelper.shared.debugPrint("$e");
      return Result.failure(CustomFailure(message: "message"));
    }
  }

  Future<Result<bool>> saveData<T>({
    required dataModel,
    required String boxName,
  }) async {
    try {
      await _hiveHelper.addData<T>(
        boxName,
        dataModel,
      );
      return const Result.success(true);
    } on Exception catch (e) {
      LogHelper.shared.debugPrint("$e");
      return Result.failure(CustomFailure(message: "message"));
    }
  }

  Future<void> updateData<T>({
    required newDataModel,
    required String boxName,
    required int index,
  }) async {
    await _hiveHelper.putDataAt<T>(
      boxName,
      newDataModel,
      index,
    );
  }
}
