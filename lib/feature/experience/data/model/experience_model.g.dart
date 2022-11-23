// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExperienceModelAdapter extends TypeAdapter<ExperienceModel> {
  @override
  final int typeId = 2;

  @override
  ExperienceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExperienceModel(
      companyName: fields[0] as String,
      profession: fields[1] as String,
      jobStartDate: fields[2] as String,
      jobEndDate: fields[3] as String,
      jobRole: fields[4] as String,
      jobType: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ExperienceModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.companyName)
      ..writeByte(1)
      ..write(obj.profession)
      ..writeByte(2)
      ..write(obj.jobStartDate)
      ..writeByte(3)
      ..write(obj.jobEndDate)
      ..writeByte(4)
      ..write(obj.jobRole)
      ..writeByte(5)
      ..write(obj.jobType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExperienceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}