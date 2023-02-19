part of 'root_cubit.dart';

abstract class RootState {}

class RootInitial extends RootState {}

class UserDataSavingFailure extends RootState {}

class UserDataSaved extends RootState {}

class UserDataDeleted extends RootState {}

class UserDataDeleteFailure extends RootState {}
class UserDataFetched extends RootState {}
class UserDataFetchFailure extends RootState {}
