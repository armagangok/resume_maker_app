
import '../../core/result_types/result/result.dart';
import '../repositories/user_data_repository.dart';

class UserDataUsecase {
  UserDataUsecase._();

  static final instance = UserDataUsecase._();

  final _repo = UserDataRepository.instance;

  Future<Result<List<String>>> fetchUserData() async {
    var response = await _repo.fetchUserData();
    return response;
  }

  Future<Result> deleteUserData(int index) async {
    var response = await _repo.deleteUserData(index);
    return response;
  }

  Future<Result<dynamic>> saveUserData(String userData) async {
    var response = await _repo.saveUserData(userData);

    return response;
  }
}
