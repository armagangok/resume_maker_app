import 'package:dartz/dartz.dart';

import '../../../../data/contracts/database_contract.dart';
import '../../../error/failure.dart';

class FirebaseHelper implements DatabaseContract {
  @override
  Future<Either<Failure, bool>> deleteData<T>({
    required int index,
    required String boxName,
  }) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> fetchData<T>({
    required String boxName,
  }) {
    // TODO: implement fetchData
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> saveData<T>({
    required dataModel,
    required String boxName,
  }) {
    // TODO: implement saveData
    throw UnimplementedError();
  }

  @override
  Future<void> updateData<T>({
    required newDataModel,
    required String boxName,
    required index,
  }) {
    // TODO: implement updateData
    throw UnimplementedError();
  }
}
