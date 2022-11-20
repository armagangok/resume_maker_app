part of 'personal_data_cubit.dart';

abstract class PersonalDataState {}

class PersonalDataInitial extends PersonalDataState {}

class PersonalDataCacheError extends PersonalDataState {}

class DataReceived extends PersonalDataState {
  @override
  late final PersonalDataModel personalData;
  DataReceived({required this.personalData});
}

class DataSaved extends PersonalDataState {
  @override
  late final PersonalDataModel personalData;

  DataSaved({required this.personalData});
}

class DataDeleted extends PersonalDataState {
  @override
  late final PersonalDataModel personalData;

  DataDeleted({required this.personalData});
}
