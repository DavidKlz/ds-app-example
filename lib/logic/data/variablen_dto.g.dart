// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variablen_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VariablenAdapter extends TypeAdapter<_$VariablenDtoImpl> {
  @override
  final int typeId = 2;

  @override
  _$VariablenDtoImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$VariablenDtoImpl(
      name: fields[0] as String,
      controltyp: fields[1] as Controltyp,
      datentyp: fields[2] as Datentyp,
    );
  }

  @override
  void write(BinaryWriter writer, _$VariablenDtoImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.controltyp)
      ..writeByte(2)
      ..write(obj.datentyp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VariablenAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
