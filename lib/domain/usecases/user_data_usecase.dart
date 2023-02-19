import 'package:dartz/dartz.dart';
import 'package:resume_maker_app/domain/repositories/user_data_repository.dart';

import '../../core/export/export.dart';

class UserDataUsecase {
  UserDataUsecase._();

  static final instance = UserDataUsecase._();

  final _repo = UserDataRepository.instance;

  Future<Either<Failure, dynamic>> fetchUserData() async {
    var response = await _repo.fetchUserData();

    return response;
  }

  Future<Either<Failure, bool>> deleteUserData(int index) async {
    var response = await _repo.deleteUserData(index);

    return response;
  }

  Future<Either<Failure, bool>> saveUserData(String userData) async {
    var response = await _repo.saveUserData(userData);

    return response;
  }
}
