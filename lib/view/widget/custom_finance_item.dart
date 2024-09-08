import 'package:flutter/material.dart';

class CustomFinanceItem extends StatelessWidget {
  const CustomFinanceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Icon(
        Icons.assessment,
        size: 40,
      ),
      title: Text(
        'Food',
        style: TextStyle(
          fontSize: 22,
        ),
      ),
      subtitle: Text('2-9-2024'),
      trailing: Text(
        '\$ 200',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}
