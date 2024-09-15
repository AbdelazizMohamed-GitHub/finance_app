import 'package:flutter/material.dart';

import 'package:finance_app/model/category_model.dart';
import 'package:flutter_svg/svg.dart';

class CustomCategoryDropdown extends StatefulWidget {
  const CustomCategoryDropdown({
    super.key,
    required this.onChanged,
  });
  final ValueChanged<String?> onChanged;
  @override
  State<CustomCategoryDropdown> createState() => _CustomCategoryDropdownState();
}

class _CustomCategoryDropdownState extends State<CustomCategoryDropdown> {
  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
        borderRadius: BorderRadius.circular(16),
        value: selectedCategory,
        isExpanded: true,
        hint: const Text("Select Category"),
        items: cateoryList.map<DropdownMenuItem<String>>((category) {
          return DropdownMenuItem<String>(
              value: category.name,
              child: Row(
                children: [
                  SvgPicture.asset(
                    width: 40,
                    height: 40,
                    category.image,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    category.name,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ));
        }).toList(),
        onChanged: (value) {
          selectedCategory = value.toString();
          widget.onChanged(selectedCategory);
        });
  }
}
