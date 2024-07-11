// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_contact.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyContactAdapter extends TypeAdapter<MyContact> {
  @override
  final int typeId = 0;

  @override
  MyContact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyContact(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MyContact obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
