import 'package:hive/hive.dart';

part 'experience_model.g.dart';

@HiveType(typeId: 2)
class ExperienceModel extends HiveObject {
  @HiveField(0)
  final String companyName;
  @HiveField(1)
  final String jobStartDate;
  @HiveField(2)
  final String jobEndDate;
  @HiveField(3)
  final String jobRole;
  @HiveField(4)
  final String skills;

  ExperienceModel({
    required this.jobRole,
    required this.companyName,
    required this.jobStartDate,
    required this.jobEndDate,
    required this.skills,
  });
}
