import 'dart:convert';
import 'dart:io';

import '../../../../core/export/export.dart';
import '../../../../domain/usecases/user_data_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getPath();
    // fetchHomeUserData();
  }

  final _userDataUsecase = UserDataUsecase.instance;

  List<FileSystemEntity> fileList = [];

  Future<List<FileSystemEntity>> getPath() async {
    final output = await getExternalStorageDirectory();
    var path = output!.path;
    fileList = Directory(path).listSync();

    print(fileList);

    return fileList;
  } 

  Future<void> saveHomeUserData(String userData) async {
    var response = await _userDataUsecase.saveUserData(userData);

    response.fold(
      (l) {
        emit(HomeUserDataSavingFailure());
      },
      (r) async {
        emit(HomeUserDataSaved());
        await fetchHomeUserData();
      },
    );
  }

  Future<void> deleteHomeUserData(int index) async {
    var response = await _userDataUsecase.deleteUserData(index);

    response.fold(
      (l) => emit(HomeUserDataDeleteFailure()),
      (r) => emit(HomeUserDataDeleted()),
    );
  }

  Future<void> fetchHomeUserData() async {
    var response = await _userDataUsecase.fetchUserData();

    response.fold(
      (l) {
        emit(HomeUserDataFetchFailure());
      },
      (r) {
        List<UserData> userDataList = [];
        if (r != null) {
          for (var element in r as List<String>) {
            var model = UserData.fromJson(jsonDecode(element));
            userDataList.add(model);
          }
          emit(HomeUserDataFetched(userDataList: userDataList));
        } else {
          emit(HomeUserDataFetched(userDataList: userDataList));
        }
      },
    );
  }
}
