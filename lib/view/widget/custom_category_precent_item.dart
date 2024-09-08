import 'package:flutter/material.dart';

class CustomCategoryPrecentItem extends StatelessWidget {
  const CustomCategoryPrecentItem(
      {super.key,
      required this.amount,
      required this.image,
      required this.categoryName});
  final String image;
  final String categoryName;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        image,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
      ),
      title: Text(
        categoryName,
        style: const TextStyle(fontSize: 20),
      ),
      subtitle: LinearProgressIndicator(
        value: amount / 100,
        backgroundColor: Colors.grey[300],
        minHeight: 10,
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
      trailing: Text(
        '$amount %',
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
