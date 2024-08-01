// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datentyp.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DatentypAdapter extends TypeAdapter<Datentyp> {
  @override
  final int typeId = 4;

  @override
  Datentyp read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Datentyp.text;
      case 1:
        return Datentyp.number;
      case 2:
        return Datentyp.date;
      case 3:
        return Datentyp.dateTime;
      case 4:
        return Datentyp.boolean;
      case 5:
        return Datentyp.singleSelection;
      case 6:
        return Datentyp.multiSelection;
      default:
        return Datentyp.text;
    }
  }

  @override
  void write(BinaryWriter writer, Datentyp obj) {
    switch (obj) {
      case Datentyp.text:
        writer.writeByte(0);
        break;
      case Datentyp.number:
        writer.writeByte(1);
        break;
      case Datentyp.date:
        writer.writeByte(2);
        break;
      case Datentyp.dateTime:
        writer.writeByte(3);
        break;
      case Datentyp.boolean:
        writer.writeByte(4);
        break;
      case Datentyp.singleSelection:
        writer.writeByte(5);
        break;
      case Datentyp.multiSelection:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatentypAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
