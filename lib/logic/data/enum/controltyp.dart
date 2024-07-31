import 'package:ds_next/logic/data/enum/datentyp.dart';
import 'package:hive/hive.dart';

part 'controltyp.g.dart';

@HiveType(typeId: 3)
enum Controltyp {
  @HiveField(0)
  textField(displayName: "Textfeld (einzeilig)"),
  @HiveField(1)
  textArea(displayName: "Textfeld (mehrzeilig)"),
  @HiveField(2)
  checkBox(displayName: "Checkbox"),
  @HiveField(3)
  calendar(displayName: "Kalender"),
  @HiveField(4)
  dropdown(displayName: "Auswahlliste");

  final String displayName;

  const Controltyp({required this.displayName});

  List<Datentyp> getDatentypen() {
    switch(this) {
      case Controltyp.textField:
        return [Datentyp.text, Datentyp.number];
      case Controltyp.textArea:
        return [Datentyp.text];
      case Controltyp.checkBox:
        return [Datentyp.boolean];
      case Controltyp.calendar:
        return [Datentyp.date, Datentyp.dateTime];
      case Controltyp.dropdown:
        return [Datentyp.singleSelection, Datentyp.multiSelection];
    }
  }
}
