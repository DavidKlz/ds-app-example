enum Datentyp {
  text("Text"), number("Zahl"), date("Datum"), dateTime("Datum und Uhrzeit"), boolean("Ja/Nein Kennzeichen"), singleSelection("einzel Auswahl"), multiSelection("mehrfach Auswahl");

  final String displayName;

  const Datentyp(this.displayName);
}