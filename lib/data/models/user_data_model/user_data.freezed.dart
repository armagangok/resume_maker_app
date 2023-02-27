// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
mixin _$UserData {
  Personal? get personal => throw _privateConstructorUsedError;
  List<Education>? get education => throw _privateConstructorUsedError;
  List<Language>? get languages => throw _privateConstructorUsedError;
  List<Qualifications>? get qualifications =>
      throw _privateConstructorUsedError;
  List<Skills>? get skills => throw _privateConstructorUsedError;
  List<Experience>? get experiences => throw _privateConstructorUsedError;
  String? get pdfPath => throw _privateConstructorUsedError;
  int? get resumeTemplateID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res, UserData>;
  @useResult
  $Res call(
      {Personal? personal,
      List<Education>? education,
      List<Language>? languages,
      List<Qualifications>? qualifications,
      List<Skills>? skills,
      List<Experience>? experiences,
      String? pdfPath,
      int? resumeTemplateID});

  $PersonalCopyWith<$Res>? get personal;
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res, $Val extends UserData>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personal = freezed,
    Object? education = freezed,
    Object? languages = freezed,
    Object? qualifications = freezed,
    Object? skills = freezed,
    Object? experiences = freezed,
    Object? pdfPath = freezed,
    Object? resumeTemplateID = freezed,
  }) {
    return _then(_value.copyWith(
      personal: freezed == personal
          ? _value.personal
          : personal // ignore: cast_nullable_to_non_nullable
              as Personal?,
      education: freezed == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as List<Education>?,
      languages: freezed == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<Language>?,
      qualifications: freezed == qualifications
          ? _value.qualifications
          : qualifications // ignore: cast_nullable_to_non_nullable
              as List<Qualifications>?,
      skills: freezed == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<Skills>?,
      experiences: freezed == experiences
          ? _value.experiences
          : experiences // ignore: cast_nullable_to_non_nullable
              as List<Experience>?,
      pdfPath: freezed == pdfPath
          ? _value.pdfPath
          : pdfPath // ignore: cast_nullable_to_non_nullable
              as String?,
      resumeTemplateID: freezed == resumeTemplateID
          ? _value.resumeTemplateID
          : resumeTemplateID // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PersonalCopyWith<$Res>? get personal {
    if (_value.personal == null) {
      return null;
    }

    return $PersonalCopyWith<$Res>(_value.personal!, (value) {
      return _then(_value.copyWith(personal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserDataCopyWith<$Res> implements $UserDataCopyWith<$Res> {
  factory _$$_UserDataCopyWith(
          _$_UserData value, $Res Function(_$_UserData) then) =
      __$$_UserDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Personal? personal,
      List<Education>? education,
      List<Language>? languages,
      List<Qualifications>? qualifications,
      List<Skills>? skills,
      List<Experience>? experiences,
      String? pdfPath,
      int? resumeTemplateID});

  @override
  $PersonalCopyWith<$Res>? get personal;
}

/// @nodoc
class __$$_UserDataCopyWithImpl<$Res>
    extends _$UserDataCopyWithImpl<$Res, _$_UserData>
    implements _$$_UserDataCopyWith<$Res> {
  __$$_UserDataCopyWithImpl(
      _$_UserData _value, $Res Function(_$_UserData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personal = freezed,
    Object? education = freezed,
    Object? languages = freezed,
    Object? qualifications = freezed,
    Object? skills = freezed,
    Object? experiences = freezed,
    Object? pdfPath = freezed,
    Object? resumeTemplateID = freezed,
  }) {
    return _then(_$_UserData(
      personal: freezed == personal
          ? _value.personal
          : personal // ignore: cast_nullable_to_non_nullable
              as Personal?,
      education: freezed == education
          ? _value._education
          : education // ignore: cast_nullable_to_non_nullable
              as List<Education>?,
      languages: freezed == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<Language>?,
      qualifications: freezed == qualifications
          ? _value._qualifications
          : qualifications // ignore: cast_nullable_to_non_nullable
              as List<Qualifications>?,
      skills: freezed == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<Skills>?,
      experiences: freezed == experiences
          ? _value._experiences
          : experiences // ignore: cast_nullable_to_non_nullable
              as List<Experience>?,
      pdfPath: freezed == pdfPath
          ? _value.pdfPath
          : pdfPath // ignore: cast_nullable_to_non_nullable
              as String?,
      resumeTemplateID: freezed == resumeTemplateID
          ? _value.resumeTemplateID
          : resumeTemplateID // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserData implements _UserData {
  const _$_UserData(
      {this.personal,
      final List<Education>? education,
      final List<Language>? languages,
      final List<Qualifications>? qualifications,
      final List<Skills>? skills,
      final List<Experience>? experiences,
      this.pdfPath,
      this.resumeTemplateID})
      : _education = education,
        _languages = languages,
        _qualifications = qualifications,
        _skills = skills,
        _experiences = experiences;

  factory _$_UserData.fromJson(Map<String, dynamic> json) =>
      _$$_UserDataFromJson(json);

  @override
  final Personal? personal;
  final List<Education>? _education;
  @override
  List<Education>? get education {
    final value = _education;
    if (value == null) return null;
    if (_education is EqualUnmodifiableListView) return _education;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Language>? _languages;
  @override
  List<Language>? get languages {
    final value = _languages;
    if (value == null) return null;
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Qualifications>? _qualifications;
  @override
  List<Qualifications>? get qualifications {
    final value = _qualifications;
    if (value == null) return null;
    if (_qualifications is EqualUnmodifiableListView) return _qualifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Skills>? _skills;
  @override
  List<Skills>? get skills {
    final value = _skills;
    if (value == null) return null;
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Experience>? _experiences;
  @override
  List<Experience>? get experiences {
    final value = _experiences;
    if (value == null) return null;
    if (_experiences is EqualUnmodifiableListView) return _experiences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? pdfPath;
  @override
  final int? resumeTemplateID;

  @override
  String toString() {
    return 'UserData(personal: $personal, education: $education, languages: $languages, qualifications: $qualifications, skills: $skills, experiences: $experiences, pdfPath: $pdfPath, resumeTemplateID: $resumeTemplateID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserData &&
            (identical(other.personal, personal) ||
                other.personal == personal) &&
            const DeepCollectionEquality()
                .equals(other._education, _education) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            const DeepCollectionEquality()
                .equals(other._qualifications, _qualifications) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            const DeepCollectionEquality()
                .equals(other._experiences, _experiences) &&
            (identical(other.pdfPath, pdfPath) || other.pdfPath == pdfPath) &&
            (identical(other.resumeTemplateID, resumeTemplateID) ||
                other.resumeTemplateID == resumeTemplateID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      personal,
      const DeepCollectionEquality().hash(_education),
      const DeepCollectionEquality().hash(_languages),
      const DeepCollectionEquality().hash(_qualifications),
      const DeepCollectionEquality().hash(_skills),
      const DeepCollectionEquality().hash(_experiences),
      pdfPath,
      resumeTemplateID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDataCopyWith<_$_UserData> get copyWith =>
      __$$_UserDataCopyWithImpl<_$_UserData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDataToJson(
      this,
    );
  }
}

abstract class _UserData implements UserData {
  const factory _UserData(
      {final Personal? personal,
      final List<Education>? education,
      final List<Language>? languages,
      final List<Qualifications>? qualifications,
      final List<Skills>? skills,
      final List<Experience>? experiences,
      final String? pdfPath,
      final int? resumeTemplateID}) = _$_UserData;

  factory _UserData.fromJson(Map<String, dynamic> json) = _$_UserData.fromJson;

  @override
  Personal? get personal;
  @override
  List<Education>? get education;
  @override
  List<Language>? get languages;
  @override
  List<Qualifications>? get qualifications;
  @override
  List<Skills>? get skills;
  @override
  List<Experience>? get experiences;
  @override
  String? get pdfPath;
  @override
  int? get resumeTemplateID;
  @override
  @JsonKey(ignore: true)
  _$$_UserDataCopyWith<_$_UserData> get copyWith =>
      throw _privateConstructorUsedError;
}
