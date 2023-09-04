import '/core/error/custom_failure.dart';
import '/core/export/export.dart';
import '/core/result_types/result/result.dart';
import '/data/datasources/user_datasource.dart';

class UserDataRepository {
  UserDataRepository._();
  static final instance = UserDataRepository._();

  final _userDataService = UserDataSource.instance;

  Future<Result<bool>> saveUserData(String userData) async {
    try {
      await _userDataService.saveUserData(userData);
      return const Result.success(true);
    } catch (e) {
      return Result.failure(CustomFailure(message: "message"));
    }
  }

  Future<Result<List<String>>> fetchUserData() async {
    try {
      var response = await _userDataService.fetchUserData();
      return Result.success(response);
    } catch (e) {
      return Result.failure(CustomFailure(message: "message"));
    }
  }

  Future<Result> deleteUserData(int index) async {
    try {
      await _userDataService.deleteUserData(index);
      return const Result.success(null);
    } catch (e) {
      return Result.failure(CustomFailure(message: "message"));
    }
  }
}
