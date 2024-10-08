import 'package:flutter/material.dart';

import 'package:finance_app/constnat.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.text,
    required this.textController,
    required this.textType,
  });
  final String text;
  final TextEditingController? textController;
  final TextInputType textType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textType,
      controller: textController,
      decoration: InputDecoration(
        contentPadding:const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        filled: true,
        fillColor: Colors.white,
        hintText: text,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
