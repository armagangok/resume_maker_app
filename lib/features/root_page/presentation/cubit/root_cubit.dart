import 'dart:convert';

import '../../../../core/export/export.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit() : super(RootInitial()) {
    fetchUserData();
  }

  final _userDataUsecase = UserDataUsecase.instance;

  Future<void> saveUserData(String userData) async {
    var response = await _userDataUsecase.saveUserData(userData);

    response.when(
      success: (success) async {
        emit(UserDataSaved());
        await fetchUserData();
      },
      failure: (failure) {
        emit(UserDataSavingFailure());
      },
    );
  }

  Future<void> deleteUserData(int index) async {
    var response = await _userDataUsecase.deleteUserData(index);

    response.when(
      success: (data) {
        emit(UserDataDeleted());
      },
      failure: (failure) {
        emit(UserDataDeleteFailure());
      },
    );
  }

  Future<void> fetchUserData() async {
    var response = await _userDataUsecase.fetchUserData();

    response.when(
      success: (data) {
        List<UserData> userDataList = [];
        if (data != null) {
          for (var element in data as List<String>) {
            var model = UserData.fromJson(jsonDecode(element));
            userDataList.add(model);
          }
          emit(UserDataFetched(userDataList: userDataList));
        } else {
          emit(UserDataFetched(userDataList: userDataList));
        }
      },
      failure: (failure) {
        emit(UserDataFetchFailure());
      },
    );
  }
}
