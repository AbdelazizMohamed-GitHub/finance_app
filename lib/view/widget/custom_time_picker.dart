import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({
    super.key,
    required this.onChanged,
  });
  final ValueChanged<DateTime> onChanged;
  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  DateTime data = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? newDate = await showDatePicker(
            context: context,
            initialDate: data,
            firstDate: DateTime(2024),
            lastDate: DateTime(2100));
        if (newDate != null) {
          setState(() {
            data = newDate;
            widget.onChanged(data);
          });
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(16)),
        child: Text(
          DateFormat.yMMMEd().format(data),
          style: const TextStyle(),
        ),
      ),
    );
  }
}
