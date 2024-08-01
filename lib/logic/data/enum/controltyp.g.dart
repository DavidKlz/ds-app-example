// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controltyp.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ControltypAdapter extends TypeAdapter<Controltyp> {
  @override
  final int typeId = 3;

  @override
  Controltyp read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Controltyp.textField;
      case 1:
        return Controltyp.textArea;
      case 2:
        return Controltyp.checkBox;
      case 3:
        return Controltyp.calendar;
      case 4:
        return Controltyp.dropdown;
      default:
        return Controltyp.textField;
    }
  }

  @override
  void write(BinaryWriter writer, Controltyp obj) {
    switch (obj) {
      case Controltyp.textField:
        writer.writeByte(0);
        break;
      case Controltyp.textArea:
        writer.writeByte(1);
        break;
      case Controltyp.checkBox:
        writer.writeByte(2);
        break;
      case Controltyp.calendar:
        writer.writeByte(3);
        break;
      case Controltyp.dropdown:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ControltypAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
