import 'package:flutter_bloc/flutter_bloc.dart';

part 'skill_state.dart';

class SkillCubit extends Cubit<SkillState> {
  SkillCubit() : super(SkillInitial());

  List<String> skills = [];

  void addSkill(String skill) {
    skills.add(skill);
    emit(AddSkill());
  }

  void removeSkill(int index) {
    skills.removeAt(index);
    emit(RemoveSkill());
  }
}
