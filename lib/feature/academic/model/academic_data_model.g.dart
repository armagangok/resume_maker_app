// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'academic_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AcademicDataModelAdapter extends TypeAdapter<AcademicDataModel> {
  @override
  final int typeId = 0;

  @override
  AcademicDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AcademicDataModel(
      schoolStartDate: fields[2] as String,
      schoolEndDate: fields[3] as String,
      grade: fields[0] as String,
      university: fields[1] as String,
      major: fields[4] as String,
      scholarship: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AcademicDataModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.grade)
      ..writeByte(1)
      ..write(obj.university)
      ..writeByte(2)
      ..write(obj.schoolStartDate)
      ..writeByte(3)
      ..write(obj.schoolEndDate)
      ..writeByte(4)
      ..write(obj.major)
      ..writeByte(5)
      ..write(obj.scholarship);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AcademicDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
