// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReferenceModelAdapter extends TypeAdapter<ReferenceModel> {
  @override
  final int typeId = 4;

  @override
  ReferenceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReferenceModel(
      name: fields[0] as String?,
      profession: fields[1] as String?,
      email: fields[3] as String?,
      phoneNumber: fields[4] as String?,
      recentCompany: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ReferenceModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.profession)
      ..writeByte(2)
      ..write(obj.recentCompany)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.phoneNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReferenceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
