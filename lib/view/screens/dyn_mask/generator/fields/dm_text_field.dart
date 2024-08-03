import 'package:flutter/material.dart';

class DmTextField extends StatefulWidget {
  const DmTextField({super.key});

  @override
  State<DmTextField> createState() => _DmTextFieldState();
}

class _DmTextFieldState extends State<DmTextField> {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }
}
