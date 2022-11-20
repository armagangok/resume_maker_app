// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonalDataModelAdapter extends TypeAdapter<PersonalDataModel> {
  @override
  final int typeId = 1;

  @override
  PersonalDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonalDataModel(
      name: fields[0] as String,
      location: fields[1] as String,
      phoneNumber: fields[2] as String,
      email: fields[3] as String,
      linkedin: fields[4] as String,
      birthday: fields[5] as String,
      imagePath: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PersonalDataModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.location)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.linkedin)
      ..writeByte(5)
      ..write(obj.birthday)
      ..writeByte(6)
      ..write(obj.imagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonalDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
