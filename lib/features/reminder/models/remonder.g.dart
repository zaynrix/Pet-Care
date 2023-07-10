// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remonder.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReminderModelAdapter extends TypeAdapter<ReminderModel> {
  @override
  final int typeId = 1;

  @override
  ReminderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReminderModel(
      title: fields[1] as String,
      id: fields[0] as int,
      createdAtDate: fields[6] as DateTime,
      createdAtTime: fields[5] as DateTime,
      isDone: fields[3] as bool,
      type: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ReminderModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.isDone)
      ..writeByte(5)
      ..write(obj.createdAtTime)
      ..writeByte(6)
      ..write(obj.createdAtDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReminderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
