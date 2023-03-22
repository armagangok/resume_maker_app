// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'education.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Education _$EducationFromJson(Map<String, dynamic> json) {
  return _Education.fromJson(json);
}

/// @nodoc
mixin _$Education {
  String? get degree => throw _privateConstructorUsedError;
  String? get major => throw _privateConstructorUsedError;
  String? get university => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EducationCopyWith<Education> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EducationCopyWith<$Res> {
  factory $EducationCopyWith(Education value, $Res Function(Education) then) =
      _$EducationCopyWithImpl<$Res, Education>;
  @useResult
  $Res call(
      {String? degree,
      String? major,
      String? university,
      String? startDate,
      String? endDate});
}

/// @nodoc
class _$EducationCopyWithImpl<$Res, $Val extends Education>
    implements $EducationCopyWith<$Res> {
  _$EducationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? degree = freezed,
    Object? major = freezed,
    Object? university = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      degree: freezed == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String?,
      major: freezed == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as String?,
      university: freezed == university
          ? _value.university
          : university // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EducationCopyWith<$Res> implements $EducationCopyWith<$Res> {
  factory _$$_EducationCopyWith(
          _$_Education value, $Res Function(_$_Education) then) =
      __$$_EducationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? degree,
      String? major,
      String? university,
      String? startDate,
      String? endDate});
}

/// @nodoc
class __$$_EducationCopyWithImpl<$Res>
    extends _$EducationCopyWithImpl<$Res, _$_Education>
    implements _$$_EducationCopyWith<$Res> {
  __$$_EducationCopyWithImpl(
      _$_Education _value, $Res Function(_$_Education) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? degree = freezed,
    Object? major = freezed,
    Object? university = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$_Education(
      degree: freezed == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String?,
      major: freezed == major
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as String?,
      university: freezed == university
          ? _value.university
          : university // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Education implements _Education {
  const _$_Education(
      {this.degree, this.major, this.university, this.startDate, this.endDate});

  factory _$_Education.fromJson(Map<String, dynamic> json) =>
      _$$_EducationFromJson(json);

  @override
  final String? degree;
  @override
  final String? major;
  @override
  final String? university;
  @override
  final String? startDate;
  @override
  final String? endDate;

  @override
  String toString() {
    return 'Education(degree: $degree, major: $major, university: $university, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Education &&
            (identical(other.degree, degree) || other.degree == degree) &&
            (identical(other.major, major) || other.major == major) &&
            (identical(other.university, university) ||
                other.university == university) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, degree, major, university, startDate, endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EducationCopyWith<_$_Education> get copyWith =>
      __$$_EducationCopyWithImpl<_$_Education>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EducationToJson(
      this,
    );
  }
}

abstract class _Education implements Education {
  const factory _Education(
      {final String? degree,
      final String? major,
      final String? university,
      final String? startDate,
      final String? endDate}) = _$_Education;

  factory _Education.fromJson(Map<String, dynamic> json) =
      _$_Education.fromJson;

  @override
  String? get degree;
  @override
  String? get major;
  @override
  String? get university;
  @override
  String? get startDate;
  @override
  String? get endDate;
  @override
  @JsonKey(ignore: true)
  _$$_EducationCopyWith<_$_Education> get copyWith =>
      throw _privateConstructorUsedError;
}
