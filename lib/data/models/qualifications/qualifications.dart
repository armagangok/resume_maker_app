import 'package:freezed_annotation/freezed_annotation.dart';

part 'qualifications.freezed.dart';
part 'qualifications.g.dart';

@freezed
abstract class Qualifications with _$Qualifications {
  const factory Qualifications({
    String? title,
    String? school,
    String? details,
  }) = _Qualifications;

  factory Qualifications.fromJson(Map<String, dynamic> json) =>
      _$QualificationsFromJson(json);
}
