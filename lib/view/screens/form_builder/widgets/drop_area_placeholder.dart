import 'package:flutter/material.dart';

class DropAreaPlaceholder extends StatelessWidget {
  final bool isVisible;

  const DropAreaPlaceholder({required this.isVisible, super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
