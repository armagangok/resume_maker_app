// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Personal _$$_PersonalFromJson(Map<String, dynamic> json) => _$_Personal(
      title: json['title'] as String?,
      fullName: json['fullName'] as String?,
      birthday: json['birthday'] as String?,
      country: json['country'] as String?,
      zipCode: json['zipCode'] as String?,
      city: json['city'] as String?,
      street: json['street'] as String?,
      summary: json['summary'] as String?,
      imagePath: json['imagePath'] as String?,
      phones:
          (json['phones'] as List<dynamic>?)?.map((e) => e as String).toList(),
      emails:
          (json['emails'] as List<dynamic>?)?.map((e) => e as String).toList(),
      links:
          (json['links'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_PersonalToJson(_$_Personal instance) =>
    <String, dynamic>{
      'title': instance.title,
      'fullName': instance.fullName,
      'birthday': instance.birthday,
      'country': instance.country,
      'zipCode': instance.zipCode,
      'city': instance.city,
      'street': instance.street,
      'summary': instance.summary,
      'imagePath': instance.imagePath,
      'phones': instance.phones,
      'emails': instance.emails,
      'links': instance.links,
    };
