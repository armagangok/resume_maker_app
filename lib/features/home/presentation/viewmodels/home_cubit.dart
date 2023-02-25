// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import '../../../../core/export/export.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required HomeUsecase homeUsecase}) : super(HomeInitial()) {
    _homeUsecase = homeUsecase;
  }

  late final HomeUsecase _homeUsecase;

  List<FileSystemEntity> fileList = [];

  Future<List<FileSystemEntity>> getPath() async {
    var response = await _homeUsecase.fetchFileEntityList();

    return response.when(
      success: (data) {
        print(data);
        return data;
      },
      failure: (failure) {
        return [];
      },
    );
  }

  Future<void> saveHomeUserData(String userData) async {
    var response = await UserDataUsecase.instance.saveUserData(userData);

    response.when(
      success: (data) async {
        emit(HomeUserDataSaved());
        await fetchHomeUserData();
      },
      failure: (failure) {
        emit(HomeUserDataSavingFailure());
      },
    );

    // fold(
    //   (l) {
    //
    //   },
    //   (r) async {

    //   },
    // );
  }

  Future<void> deleteHomeUserData(int index) async {
    var response = await UserDataUsecase.instance.deleteUserData(index);

    response.when(
      success: (data) {
        print(data);
      },
      failure: (failure) {
        print(failure);
      },
    );
  }

  Future<void> fetchHomeUserData() async {
    var response = await UserDataUsecase.instance.fetchUserData();

    response.when(
      success: (data) {
        List<UserData> userDataList = [];
        if (data != null) {
          for (var element in data as List<String>) {
            var model = UserData.fromJson(jsonDecode(element));
            userDataList.add(model);
          }
          emit(HomeUserDataFetched(userDataList: userDataList));
        } else {
          emit(HomeUserDataFetched(userDataList: userDataList));
        }
      },
      failure: (failure) {
        emit(HomeUserDataFetchFailure());
      },
    );
  }
}
