// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


import '../../../../../core/export/export.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required UserDataUsecase homeUsecase}) : super(HomeInitial()) {
    _userDataUsecase = homeUsecase;
  }

  late final UserDataUsecase _userDataUsecase;

  

  Future<void> saveUserData(String userData) async {
    var response = await _userDataUsecase.saveUserData(userData);

    response.when(
      success: (data) async {
        emit(HomeUserDataSaved());
        await fetchUserData();
      },
      failure: (failure) {
        emit(HomeUserDataSavingFailure());
      },
    );
  }

  Future<void> deleteUserData(int index) async {
    emit(HomeUserDataDeleting());    
    var response = await _userDataUsecase.deleteUserData(index);

    response.when(
      success: (data) async {        
        emit(HomeInitial());
        emit(HomeUserDataDeleted());
        await fetchUserData();     
      },
      failure: (failure) {
        emit(HomeUserDataDeleteFailure());
      },
    );
  }

  Future<void> fetchUserData() async {
    emit(HomeUserDataFetching());
    var response = await _userDataUsecase.fetchUserData();

    response.when(
      success: (data) {
        List<UserData> userDataList = [];
  
        for (var element in data) {
          var model = UserData.fromJson(jsonDecode(element));
          userDataList.add(model);
        }
        emit(HomeUserDataFetched(userDataList: userDataList));
        
      },
      failure: (failure) {
        emit(HomeUserDataFetchFailure());
      },
    );
  }
}
