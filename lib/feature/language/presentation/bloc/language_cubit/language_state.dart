part of 'language_cubit.dart';

abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class AddLanguage extends LanguageState {}

class LanguageRemoved extends LanguageState {}

class LanguageAdded extends LanguageState {}

class LanguageAdding extends LanguageState {}

class LanguageRemoving extends LanguageState {}
