// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qualifications.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Qualifications _$QualificationsFromJson(Map<String, dynamic> json) {
  return _Qualifications.fromJson(json);
}

/// @nodoc
mixin _$Qualifications {
  String? get title => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QualificationsCopyWith<Qualifications> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QualificationsCopyWith<$Res> {
  factory $QualificationsCopyWith(
          Qualifications value, $Res Function(Qualifications) then) =
      _$QualificationsCopyWithImpl<$Res, Qualifications>;
  @useResult
  $Res call({String? title, String? details});
}

/// @nodoc
class _$QualificationsCopyWithImpl<$Res, $Val extends Qualifications>
    implements $QualificationsCopyWith<$Res> {
  _$QualificationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QualificationsCopyWith<$Res>
    implements $QualificationsCopyWith<$Res> {
  factory _$$_QualificationsCopyWith(
          _$_Qualifications value, $Res Function(_$_Qualifications) then) =
      __$$_QualificationsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? details});
}

/// @nodoc
class __$$_QualificationsCopyWithImpl<$Res>
    extends _$QualificationsCopyWithImpl<$Res, _$_Qualifications>
    implements _$$_QualificationsCopyWith<$Res> {
  __$$_QualificationsCopyWithImpl(
      _$_Qualifications _value, $Res Function(_$_Qualifications) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? details = freezed,
  }) {
    return _then(_$_Qualifications(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Qualifications implements _Qualifications {
  const _$_Qualifications({this.title, this.details});

  factory _$_Qualifications.fromJson(Map<String, dynamic> json) =>
      _$$_QualificationsFromJson(json);

  @override
  final String? title;
  @override
  final String? details;

  @override
  String toString() {
    return 'Qualifications(title: $title, details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Qualifications &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, details);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QualificationsCopyWith<_$_Qualifications> get copyWith =>
      __$$_QualificationsCopyWithImpl<_$_Qualifications>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QualificationsToJson(
      this,
    );
  }
}

abstract class _Qualifications implements Qualifications {
  const factory _Qualifications({final String? title, final String? details}) =
      _$_Qualifications;

  factory _Qualifications.fromJson(Map<String, dynamic> json) =
      _$_Qualifications.fromJson;

  @override
  String? get title;
  @override
  String? get details;
  @override
  @JsonKey(ignore: true)
  _$$_QualificationsCopyWith<_$_Qualifications> get copyWith =>
      throw _privateConstructorUsedError;
}
