import 'package:resume_maker_app/core/error/custom_failure.dart';
import 'package:resume_maker_app/data/services/user_data_service.dart';

import '../../core/result_types/result/result.dart';

class UserDataRepository {
  UserDataRepository._();
  static final instance = UserDataRepository._();

  final _userDataService = UserDataServiceImp.instance;

  Future<Result<bool>> saveUserData(String userData) async {
    try {
      await _userDataService.saveUserData(userData);
      return const Result.success(true);
    } catch (e) {
      return Result.failure(CustomFailure(message: "message"));
    }
  }

  Future<Result<dynamic>> fetchUserData() async {
    try {
      var response = await _userDataService.fetchUserData();
      return Result.success(response);
    } catch (e) {
      return Result.failure(CustomFailure(message: "message"));
    }
  }

  Future<Result<bool>> deleteUserData(int index) async {
    try {
      await _userDataService.deleteUserData(index);
      return const Result.success(true);
    } catch (e) {
      return Result.failure(CustomFailure(message: "message"));
    }
  }
}
