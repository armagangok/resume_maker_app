import 'package:hive/hive.dart';

part 'experience_model.g.dart';

@HiveType(typeId: 2)
class ExperienceModel extends HiveObject {
  @HiveField(0)
  final String companyName;
  @HiveField(1)
  final String profession;
  @HiveField(2)
  final String jobStartDate;
  @HiveField(3)
  final String jobEndDate;
  @HiveField(4)
  final String jobRole;
  @HiveField(5)
  final String jobType;

  ExperienceModel({
    required this.companyName,
    required this.profession,
    required this.jobStartDate,
    required this.jobEndDate,
    required this.jobRole,
    required this.jobType,
  });
}
