// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'skills.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Skills _$SkillsFromJson(Map<String, dynamic> json) {
  return _Skills.fromJson(json);
}

/// @nodoc
mixin _$Skills {
  String? get skillName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SkillsCopyWith<Skills> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SkillsCopyWith<$Res> {
  factory $SkillsCopyWith(Skills value, $Res Function(Skills) then) =
      _$SkillsCopyWithImpl<$Res, Skills>;
  @useResult
  $Res call({String? skillName, String? description});
}

/// @nodoc
class _$SkillsCopyWithImpl<$Res, $Val extends Skills>
    implements $SkillsCopyWith<$Res> {
  _$SkillsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skillName = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      skillName: freezed == skillName
          ? _value.skillName
          : skillName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SkillsCopyWith<$Res> implements $SkillsCopyWith<$Res> {
  factory _$$_SkillsCopyWith(_$_Skills value, $Res Function(_$_Skills) then) =
      __$$_SkillsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? skillName, String? description});
}

/// @nodoc
class __$$_SkillsCopyWithImpl<$Res>
    extends _$SkillsCopyWithImpl<$Res, _$_Skills>
    implements _$$_SkillsCopyWith<$Res> {
  __$$_SkillsCopyWithImpl(_$_Skills _value, $Res Function(_$_Skills) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skillName = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_Skills(
      skillName: freezed == skillName
          ? _value.skillName
          : skillName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Skills implements _Skills {
  const _$_Skills({this.skillName, this.description});

  factory _$_Skills.fromJson(Map<String, dynamic> json) =>
      _$$_SkillsFromJson(json);

  @override
  final String? skillName;
  @override
  final String? description;

  @override
  String toString() {
    return 'Skills(skillName: $skillName, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Skills &&
            (identical(other.skillName, skillName) ||
                other.skillName == skillName) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, skillName, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SkillsCopyWith<_$_Skills> get copyWith =>
      __$$_SkillsCopyWithImpl<_$_Skills>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SkillsToJson(
      this,
    );
  }
}

abstract class _Skills implements Skills {
  const factory _Skills({final String? skillName, final String? description}) =
      _$_Skills;

  factory _Skills.fromJson(Map<String, dynamic> json) = _$_Skills.fromJson;

  @override
  String? get skillName;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_SkillsCopyWith<_$_Skills> get copyWith =>
      throw _privateConstructorUsedError;
}
