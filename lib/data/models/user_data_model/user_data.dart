import 'package:freezed_annotation/freezed_annotation.dart';

import '../education/education.dart';
import '../experience/experience.dart';
import '../language/language.dart';
import '../personal/personal.dart';
import '../qualifications/qualifications.dart';
import '../skills/skills.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
abstract class UserData with _$UserData {
  const factory UserData({
    Personal? personal,
    List<Education>? education,
    List<Language>? languages,
    List<Qualifications>? qualifications,
    List<Skills>? skills,
    List<Experience>? experiences,
    String? pdfID,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(
        json,
      );
}
