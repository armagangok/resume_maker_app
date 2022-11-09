import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  List<String> languages = [];

  void addLanguage(String language) {
    emit(LanguageAdding());
    languages.add(language);
    emit(LanguageAdded());
  }

  void removeLanguage(int index) {
    emit(LanguageRemoving());
    languages.removeAt(index);
    emit(LanguageRemoved());
  }
}
