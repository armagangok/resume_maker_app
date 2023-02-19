import 'dart:convert';

import '../../../../core/export/export.dart';
import '../../../../domain/usecases/user_data_usecase.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit() : super(RootInitial()) {
    fetchUserData();
  }

  final _userDataUsecase = UserDataUsecase.instance;

  Future<void> saveUserData(String userData) async {
    var response = await _userDataUsecase.saveUserData(userData);

    response.fold(
      (l) {
        emit(UserDataSavingFailure());
      },
      (r) async{
        emit(UserDataSaved());
        await fetchUserData();
      },
    );
  }

  Future<void> deleteUserData(int index) async {
    var response = await _userDataUsecase.deleteUserData(index);

    response.fold(
      (l) => emit(UserDataDeleteFailure()),
      (r) => emit(UserDataDeleted()),
    );
  }

  Future<void> fetchUserData() async {
    var response = await _userDataUsecase.fetchUserData();

    response.fold(
      (l) {
        emit(UserDataFetchFailure());
      },
      (r) {
        List<UserData> userDataList = [];
        if (r != null) {
          for (var element in r as List<String>) {
            var model = UserData.fromJson(jsonDecode(element));
            userDataList.add(model);
          }
          emit(UserDataFetched(userDataList: userDataList));
        } else {
          emit(UserDataFetched(userDataList: userDataList));
        }
      },
    );
  }
}
