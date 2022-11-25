// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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
    required this.grade,
    required this.university,
    required this.schoolStartDate,
    required this.schoolEndDate,
    required this.major,
    required this.scholarship,
  });

  AcademicDataModel copyWith({
    String? grade,
    String? university,
    String? schoolStartDate,
    String? schoolEndDate,
    String? major,
    String? scholarship,
  }) {
    return AcademicDataModel(
      grade: grade ?? this.grade,
      university: university ?? this.university,
      schoolStartDate: schoolStartDate ?? this.schoolStartDate,
      schoolEndDate: schoolEndDate ?? this.schoolEndDate,
      major: major ?? this.major,
      scholarship: scholarship ?? this.scholarship,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'grade': grade,
      'university': university,
      'schoolStartDate': schoolStartDate,
      'schoolEndDate': schoolEndDate,
      'major': major,
      'scholarship': scholarship,
    };
  }

  factory AcademicDataModel.fromMap(Map<String, dynamic> map) {
    return AcademicDataModel(
      grade: map['grade'] != null ? map['grade'] as String : null,
      university:
          map['university'] != null ? map['university'] as String : null,
      schoolStartDate: map['schoolStartDate'] != null
          ? map['schoolStartDate'] as String
          : null,
      schoolEndDate:
          map['schoolEndDate'] != null ? map['schoolEndDate'] as String : null,
      major: map['major'] != null ? map['major'] as String : null,
      scholarship:
          map['scholarship'] != null ? map['scholarship'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AcademicDataModel.fromJson(String source) =>
      AcademicDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AcademicDataModel(grade: $grade, university: $university, schoolStartDate: $schoolStartDate, schoolEndDate: $schoolEndDate, major: $major, scholarship: $scholarship)';
  }


}
