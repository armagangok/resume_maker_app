import 'package:freezed_annotation/freezed_annotation.dart';

part 'qualifications.freezed.dart';
part 'qualifications.g.dart';

@freezed
abstract class Voluntary with _$Voluntary {
  const factory Voluntary({
    String? voluntaryTitle,
    String? voluntaryDescription,
  }) = _Voluntary;

  factory Voluntary.fromJson(Map<String, dynamic> json) =>
      _$VoluntaryFromJson(json);
}
