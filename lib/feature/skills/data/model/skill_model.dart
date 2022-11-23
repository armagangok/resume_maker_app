import 'package:hive/hive.dart';
part 'skill_model.g.dart';
@HiveType(typeId: 5)
class SkillModel extends HiveObject{
  @HiveField(0)
  final String skill;
  SkillModel({required this.skill});
}
