enum Controltyp {
  textField(displayName: "Textfeld (einzeilig)"),
  textArea(displayName: "Textfeld (mehrzeilig)"),
  checkBox(displayName: "Checkbox"),
  calendar(displayName: "Kalender"),
  dropdown(displayName: "Auswahlliste");

  final String displayName;

  const Controltyp({required this.displayName});
}
