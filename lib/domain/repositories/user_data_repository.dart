import 'package:dartz/dartz.dart';
import 'package:resume_maker_app/core/error/failure.dart';
import 'package:resume_maker_app/data/services/user_data_service.dart';

class UserDataRepository {
  final _userDataService = UserDataServiceImp.instance;

  Future<Either<Failure, bool>> saveUserData(String userData) async {
    try {
      await _userDataService.saveUserData(userData);

      return const Right(true);
    } catch (e) {
      return Left(LocalDeletingFailure());
    }
  }

  Future<Either<Failure, dynamic>> fetchUserData() async {
    try {
      var response = await _userDataService.fetchUserData();

      return Right(response);
    } catch (e) {
      return Left(LocalFetchFailure());
    }
  }

  Future<Either<Failure, bool>> deleteUserData(int index) async {
    try {
      await _userDataService.deleteUserData(index);

      return const Right(true);
    } catch (e) {
      return Left(LocalFetchFailure());
    }
  }
}
