part of 'skill_cubit.dart';

abstract class SkillState {}

class SkillInitial extends SkillState {}

class SkillDataReceived extends SkillState {
  SkillDataReceived({required this.skillData});

  late final List<SkillModel> skillData;
}

class SkillFetched extends SkillDataReceived {
  SkillFetched({required super.skillData});
}

class SkillSavingError extends SkillState {
  static const message = "Error occured while saving data.";
}

class SkillDeletingError extends SkillState {
  static const message = "Error occured while deleting data.";
}

class SkillFetcingError extends SkillState {
  static const message = "Error occured while fetching data.";
}

class SkillDeleted extends SkillDataReceived {
  SkillDeleted({required super.skillData});

  static const message = "Skill deleted succesfully.";
}

class ReloadPage extends SkillState {}
