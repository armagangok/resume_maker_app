import '../export/core_export.dart';

import 'package:dartz/dartz.dart';

class LocalDatabaseRepositoryImp extends DatabaseContract {
  LocalDatabaseRepositoryImp._();
  static final instance = LocalDatabaseRepositoryImp._();

  @override
  Future<Either<Failure, dynamic>> fetchData<T>(
      {required String boxName}) async {
    try {
      var response = await HiveHelper.shared.getAll<T>(boxName);

      if (response.isEmpty) {
        return Left(HiveNullData());
      } else {
        return Right(response);
      }
    } on Exception catch (e) {
      LogHelper.shared.errorPrint("$e");
      return Left(HiveFetchFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteData<T>({
    required int index,
    required String boxName,
  }) async {
    try {
      await HiveHelper.shared.deleteDataAt<T>(
        boxName,
        index,
      );

      return const Right(true);
    } catch (e) {
      LogHelper.shared.debugPrint("$e");
      return Left(HiveDeletingFailure());
    }
  }

  @override
  Future<void> updateData<T>(
      {required newDataModel, required String boxName}) async {}

  @override
  Future<Either<Failure, bool>> saveData<T>(
      {required dataModel, required String boxName}) async {
    try {
      await HiveHelper.shared.addData<T>(
        boxName,
        dataModel,
      );
      return const Right(true);
    } on Exception catch (e) {
      LogHelper.shared.debugPrint("$e");
      return Left(HiveSavingFailure());
    }
  }
}
