import 'package:flutter/material.dart';

class CustomTypeDropdown extends StatelessWidget {
  CustomTypeDropdown({super.key});
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
        });
  }
}
