// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'root_cubit.dart';

abstract class RootState {}

class RootInitial extends RootState {}

class UserDataSavingFailure extends RootState {}

class UserDataSaved extends RootState {}

class UserDataDeleted extends RootState {}

class UserDataDeleteFailure extends RootState {}

class UserDataFetched extends RootState {
  List<UserData> userDataList;
  
  UserDataFetched({
    required this.userDataList,
  });
  
}

class UserDataFetchFailure extends RootState {}
