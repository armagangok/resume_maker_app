import 'package:freezed_annotation/freezed_annotation.dart';

part 'education.freezed.dart';
part 'education.g.dart';

@freezed
abstract class Education with _$Education {
  const factory Education({
    String? degree,
    String? school,
    String? university,
    String? startDate,
    String? endDate,
  }) = _Education;

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);
}
