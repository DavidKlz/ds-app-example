import 'package:hive/hive.dart';

part 'datentyp.g.dart';

@HiveType(typeId: 4)
enum Datentyp {
  @HiveField(0)
  text("Text"),
  @HiveField(1)
  number("Zahl"),
  @HiveField(2)
  date("Datum"),
  @HiveField(3)
  dateTime("Datum und Uhrzeit"),
  @HiveField(4)
  boolean("Ja/Nein Kennzeichen"),
  @HiveField(5)
  singleSelection("einzel Auswahl"),
  @HiveField(6)
  multiSelection("mehrfach Auswahl");

  final String displayName;

  const Datentyp(this.displayName);
}
