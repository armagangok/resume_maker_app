// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EducationDataModelAdapter extends TypeAdapter<EducationDataModel> {
  @override
  final int typeId = 0;

  @override
  EducationDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EducationDataModel(
      grade: fields[0] as String?,
      university: fields[1] as String?,
      schoolStartDate: fields[2] as String?,
      schoolEndDate: fields[3] as String?,
      major: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EducationDataModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.grade)
      ..writeByte(1)
      ..write(obj.university)
      ..writeByte(2)
      ..write(obj.schoolStartDate)
      ..writeByte(3)
      ..write(obj.schoolEndDate)
      ..writeByte(4)
      ..write(obj.major);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EducationDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
