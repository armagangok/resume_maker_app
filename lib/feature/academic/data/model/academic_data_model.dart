import 'package:hive/hive.dart';

part 'academic_data_model.g.dart';

@HiveType(typeId: 0)
class AcademicDataModel extends HiveObject {
  @HiveField(0)
  final String? grade;
  @HiveField(1)
  final String? university;
  @HiveField(2)
  final String? schoolStartDate;
  @HiveField(3)
  final String? schoolEndDate;
  @HiveField(4)
  final String? major;
  @HiveField(5)
  final String? scholarship;

  AcademicDataModel({
    required this.schoolStartDate,
    required this.schoolEndDate,
    required this.grade,
    required this.university,
    required this.major,
    required this.scholarship,
  });
}
