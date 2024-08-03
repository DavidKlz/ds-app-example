import 'package:flutter/material.dart';

import '../../../../logic/data/formular_dto.dart';

class FormularListItem extends StatelessWidget {
  final FormularDto item;
  final VoidCallback onRemove;
  final VoidCallback onEdit;
  final VoidCallback onDynMask;

  const FormularListItem({
    required this.item,
    required this.onEdit,
    required this.onRemove,
    required this.onDynMask,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: onDynMask, icon: const Icon(Icons.format_align_justify)),
          IconButton(onPressed: onEdit, icon: const Icon(Icons.edit)),
          IconButton(onPressed: onRemove, icon: const Icon(Icons.delete)),
        ],
      ),
    );
  }
}
