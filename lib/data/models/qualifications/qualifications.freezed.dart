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

Voluntary _$VoluntaryFromJson(Map<String, dynamic> json) {
  return _Voluntary.fromJson(json);
}

/// @nodoc
mixin _$Voluntary {
  String? get voluntaryTitle => throw _privateConstructorUsedError;
  String? get voluntaryDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VoluntaryCopyWith<Voluntary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoluntaryCopyWith<$Res> {
  factory $VoluntaryCopyWith(Voluntary value, $Res Function(Voluntary) then) =
      _$VoluntaryCopyWithImpl<$Res, Voluntary>;
  @useResult
  $Res call({String? voluntaryTitle, String? voluntaryDescription});
}

/// @nodoc
class _$VoluntaryCopyWithImpl<$Res, $Val extends Voluntary>
    implements $VoluntaryCopyWith<$Res> {
  _$VoluntaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voluntaryTitle = freezed,
    Object? voluntaryDescription = freezed,
  }) {
    return _then(_value.copyWith(
      voluntaryTitle: freezed == voluntaryTitle
          ? _value.voluntaryTitle
          : voluntaryTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      voluntaryDescription: freezed == voluntaryDescription
          ? _value.voluntaryDescription
          : voluntaryDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VoluntaryCopyWith<$Res> implements $VoluntaryCopyWith<$Res> {
  factory _$$_VoluntaryCopyWith(
          _$_Voluntary value, $Res Function(_$_Voluntary) then) =
      __$$_VoluntaryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? voluntaryTitle, String? voluntaryDescription});
}

/// @nodoc
class __$$_VoluntaryCopyWithImpl<$Res>
    extends _$VoluntaryCopyWithImpl<$Res, _$_Voluntary>
    implements _$$_VoluntaryCopyWith<$Res> {
  __$$_VoluntaryCopyWithImpl(
      _$_Voluntary _value, $Res Function(_$_Voluntary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voluntaryTitle = freezed,
    Object? voluntaryDescription = freezed,
  }) {
    return _then(_$_Voluntary(
      voluntaryTitle: freezed == voluntaryTitle
          ? _value.voluntaryTitle
          : voluntaryTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      voluntaryDescription: freezed == voluntaryDescription
          ? _value.voluntaryDescription
          : voluntaryDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Voluntary implements _Voluntary {
  const _$_Voluntary({this.voluntaryTitle, this.voluntaryDescription});

  factory _$_Voluntary.fromJson(Map<String, dynamic> json) =>
      _$$_VoluntaryFromJson(json);

  @override
  final String? voluntaryTitle;
  @override
  final String? voluntaryDescription;

  @override
  String toString() {
    return 'Voluntary(voluntaryTitle: $voluntaryTitle, voluntaryDescription: $voluntaryDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Voluntary &&
            (identical(other.voluntaryTitle, voluntaryTitle) ||
                other.voluntaryTitle == voluntaryTitle) &&
            (identical(other.voluntaryDescription, voluntaryDescription) ||
                other.voluntaryDescription == voluntaryDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, voluntaryTitle, voluntaryDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VoluntaryCopyWith<_$_Voluntary> get copyWith =>
      __$$_VoluntaryCopyWithImpl<_$_Voluntary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VoluntaryToJson(
      this,
    );
  }
}

abstract class _Voluntary implements Voluntary {
  const factory _Voluntary(
      {final String? voluntaryTitle,
      final String? voluntaryDescription}) = _$_Voluntary;

  factory _Voluntary.fromJson(Map<String, dynamic> json) =
      _$_Voluntary.fromJson;

  @override
  String? get voluntaryTitle;
  @override
  String? get voluntaryDescription;
  @override
  @JsonKey(ignore: true)
  _$$_VoluntaryCopyWith<_$_Voluntary> get copyWith =>
      throw _privateConstructorUsedError;
}
