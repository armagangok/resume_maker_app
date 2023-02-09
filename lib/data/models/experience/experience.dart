import 'package:freezed_annotation/freezed_annotation.dart';

part 'experience.freezed.dart';
part 'experience.g.dart';

@freezed
abstract class Experience with _$Experience {
  const factory Experience({
    String? company,
    String? jobTitle,
    String? jobDuties,
    String? endDate,
    String? startDate,
  }) = _Experience;

  factory Experience.fromJson(Map<String, dynamic> json) => _$ExperienceFromJson(json);
}
