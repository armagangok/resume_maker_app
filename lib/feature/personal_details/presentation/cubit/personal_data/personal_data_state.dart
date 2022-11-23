part of 'personal_data_cubit.dart';

abstract class PersonalDataState {}

abstract class DataReceivedContract extends PersonalDataState {
  late final PersonalDataModel personalData;
  DataReceivedContract({required this.personalData});
}

class PersonalDataInitial implements DataReceivedContract {
  @override
  late final PersonalDataModel personalData;
  PersonalDataInitial({required this.personalData});
}

class PersonalDataCacheError extends PersonalDataState {
  static const message = "En error occured while saving your personal data!";
}

class PersonalDataReceived implements DataReceivedContract {
  @override
  late final PersonalDataModel personalData;
  PersonalDataReceived({required this.personalData});
}

class PersonalDataSaved extends PersonalDataState {
  static const message = "Personal Data saved successfully!";
}

class PersonalDataDeleted implements DataReceivedContract {
  @override
  late final PersonalDataModel personalData;

  PersonalDataDeleted({required this.personalData});
}
