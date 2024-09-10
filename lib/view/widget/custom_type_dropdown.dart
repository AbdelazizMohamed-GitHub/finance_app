// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTypeDropdown extends StatefulWidget {
  const CustomTypeDropdown({
    super.key,
    required this.onChanged,
  });
  final ValueChanged<String?> onChanged;

  @override
  State<CustomTypeDropdown> createState() => _CustomTypeDropdownState();
}

class _CustomTypeDropdownState extends State<CustomTypeDropdown> {
  String? selectValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
        borderRadius: BorderRadius.circular(16),
        hint: const Text('Select Type'),
        value: selectValue,
        items: const [
          DropdownMenuItem(
            value: 'Income',
            child: Text('Income'),
          ),
          DropdownMenuItem(
            value: 'Expense',
            child: Text('Expense'),
          ),
        ],
        onChanged: (value) {
          selectValue = value;
          widget.onChanged(value);
        });
  }
}
