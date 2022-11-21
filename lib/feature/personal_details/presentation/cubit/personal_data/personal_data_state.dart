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

class PersonalDataCacheError extends PersonalDataState {}

class DataReceived implements DataReceivedContract {
  @override
  late final PersonalDataModel personalData;
  DataReceived({required this.personalData});
}

class DataSaved implements DataReceivedContract {
  @override
  late final PersonalDataModel personalData;

  DataSaved({required this.personalData});
}

class DataDeleted implements DataReceivedContract {
  @override
  late final PersonalDataModel personalData;

  DataDeleted({required this.personalData});
}
