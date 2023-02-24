part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeUserDataSavingFailure extends HomeState {}

class HomeUserDataSaved extends HomeState {}

class HomeUserDataDeleted extends HomeState {}

class HomeUserDataDeleteFailure extends HomeState {}

class HomeUserDataFetched extends HomeState {
  List<UserData> userDataList;

  HomeUserDataFetched({
    required this.userDataList,
  });
}

class HomeUserDataFetchFailure extends HomeState {}
