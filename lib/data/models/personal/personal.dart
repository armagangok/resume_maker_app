import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal.freezed.dart';
part 'personal.g.dart';

@freezed
abstract class Personal with _$Personal {
  const factory Personal({
    String? title,
    String? fullName,
    String? birthday,
    String? country,
    String? zipCode,
    String? city,
    String? street,
    String? summary,
    List<String>? phones,
    List<String>? emails,
    List<String>? links,
  }) = _Personal;

  factory Personal.fromJson(Map<String, dynamic> json) =>
      _$PersonalFromJson(json);
}
