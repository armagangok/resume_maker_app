// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Language _$LanguageFromJson(Map<String, dynamic> json) {
  return _Language.fromJson(json);
}

/// @nodoc
mixin _$Language {
  String? get languageName => throw _privateConstructorUsedError;
  String? get writing => throw _privateConstructorUsedError;
  String? get reading => throw _privateConstructorUsedError;
  String? get speaking => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LanguageCopyWith<Language> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageCopyWith<$Res> {
  factory $LanguageCopyWith(Language value, $Res Function(Language) then) =
      _$LanguageCopyWithImpl<$Res, Language>;
  @useResult
  $Res call(
      {String? languageName,
      String? writing,
      String? reading,
      String? speaking});
}

/// @nodoc
class _$LanguageCopyWithImpl<$Res, $Val extends Language>
    implements $LanguageCopyWith<$Res> {
  _$LanguageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageName = freezed,
    Object? writing = freezed,
    Object? reading = freezed,
    Object? speaking = freezed,
  }) {
    return _then(_value.copyWith(
      languageName: freezed == languageName
          ? _value.languageName
          : languageName // ignore: cast_nullable_to_non_nullable
              as String?,
      writing: freezed == writing
          ? _value.writing
          : writing // ignore: cast_nullable_to_non_nullable
              as String?,
      reading: freezed == reading
          ? _value.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String?,
      speaking: freezed == speaking
          ? _value.speaking
          : speaking // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LanguageCopyWith<$Res> implements $LanguageCopyWith<$Res> {
  factory _$$_LanguageCopyWith(
          _$_Language value, $Res Function(_$_Language) then) =
      __$$_LanguageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? languageName,
      String? writing,
      String? reading,
      String? speaking});
}

/// @nodoc
class __$$_LanguageCopyWithImpl<$Res>
    extends _$LanguageCopyWithImpl<$Res, _$_Language>
    implements _$$_LanguageCopyWith<$Res> {
  __$$_LanguageCopyWithImpl(
      _$_Language _value, $Res Function(_$_Language) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageName = freezed,
    Object? writing = freezed,
    Object? reading = freezed,
    Object? speaking = freezed,
  }) {
    return _then(_$_Language(
      languageName: freezed == languageName
          ? _value.languageName
          : languageName // ignore: cast_nullable_to_non_nullable
              as String?,
      writing: freezed == writing
          ? _value.writing
          : writing // ignore: cast_nullable_to_non_nullable
              as String?,
      reading: freezed == reading
          ? _value.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String?,
      speaking: freezed == speaking
          ? _value.speaking
          : speaking // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Language implements _Language {
  const _$_Language(
      {this.languageName, this.writing, this.reading, this.speaking});

  factory _$_Language.fromJson(Map<String, dynamic> json) =>
      _$$_LanguageFromJson(json);

  @override
  final String? languageName;
  @override
  final String? writing;
  @override
  final String? reading;
  @override
  final String? speaking;

  @override
  String toString() {
    return 'Language(languageName: $languageName, writing: $writing, reading: $reading, speaking: $speaking)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Language &&
            (identical(other.languageName, languageName) ||
                other.languageName == languageName) &&
            (identical(other.writing, writing) || other.writing == writing) &&
            (identical(other.reading, reading) || other.reading == reading) &&
            (identical(other.speaking, speaking) ||
                other.speaking == speaking));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, languageName, writing, reading, speaking);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LanguageCopyWith<_$_Language> get copyWith =>
      __$$_LanguageCopyWithImpl<_$_Language>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LanguageToJson(
      this,
    );
  }
}

abstract class _Language implements Language {
  const factory _Language(
      {final String? languageName,
      final String? writing,
      final String? reading,
      final String? speaking}) = _$_Language;

  factory _Language.fromJson(Map<String, dynamic> json) = _$_Language.fromJson;

  @override
  String? get languageName;
  @override
  String? get writing;
  @override
  String? get reading;
  @override
  String? get speaking;
  @override
  @JsonKey(ignore: true)
  _$$_LanguageCopyWith<_$_Language> get copyWith =>
      throw _privateConstructorUsedError;
}
