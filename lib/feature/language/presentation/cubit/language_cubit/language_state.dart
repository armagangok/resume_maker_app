part of 'language_cubit.dart';

abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class LanguageDataReceived extends LanguageState {
  LanguageDataReceived({required this.languageData});

  late final List<LanguageModel> languageData;
}

class LanguageFetched extends LanguageDataReceived {
  LanguageFetched({required super.languageData});
}

class LanguageSavingError extends LanguageState {
  static const message = "Error occured while saving data.";
}

class LanguageDeletingError extends LanguageState {
  static const message = "Error occured while deleting data.";
}

class LanguageFetcingError extends LanguageState {
  static const message = "Error occured while fetching data.";
}

class LanguageDeleted extends LanguageDataReceived {
  LanguageDeleted({required super.languageData});

  static const message = "Language deleted succesfully.";
}

class ReloadPage extends LanguageState {}
