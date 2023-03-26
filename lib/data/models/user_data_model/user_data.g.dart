// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      personal: json['personal'] == null
          ? null
          : Personal.fromJson(json['personal'] as Map<String, dynamic>),
      education: (json['education'] as List<dynamic>?)
          ?.map((e) => Education.fromJson(e as Map<String, dynamic>))
          .toList(),
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => Language.fromJson(e as Map<String, dynamic>))
          .toList(),
      qualifications: (json['qualifications'] as List<dynamic>?)
          ?.map((e) => Voluntary.fromJson(e as Map<String, dynamic>))
          .toList(),
      skills: (json['skills'] as List<dynamic>?)
          ?.map((e) => Skills.fromJson(e as Map<String, dynamic>))
          .toList(),
      experiences: (json['experiences'] as List<dynamic>?)
          ?.map((e) => Experience.fromJson(e as Map<String, dynamic>))
          .toList(),
      pdfPath: json['pdfPath'] as String?,
      resumeTemplateID: json['resumeTemplateID'] as int?,
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'personal': instance.personal,
      'education': instance.education,
      'languages': instance.languages,
      'qualifications': instance.qualifications,
      'skills': instance.skills,
      'experiences': instance.experiences,
      'pdfPath': instance.pdfPath,
      'resumeTemplateID': instance.resumeTemplateID,
    };
