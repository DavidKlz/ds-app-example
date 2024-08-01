// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formular_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FormularAdapter extends TypeAdapter<_$FormularDtoImpl> {
  @override
  final int typeId = 1;

  @override
  _$FormularDtoImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$FormularDtoImpl(
      uuid: fields[0] as String,
      name: fields[1] as String,
      variablen: (fields[2] as List).cast<VariablenDto>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$FormularDtoImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.variablen);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FormularAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
