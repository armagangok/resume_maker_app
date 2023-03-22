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
    String? imagePath,
    String? phone,
    String? email,
    String? link,
  }) = _Personal;

  factory Personal.fromJson(Map<String, dynamic> json) =>
      _$PersonalFromJson(json);
}
