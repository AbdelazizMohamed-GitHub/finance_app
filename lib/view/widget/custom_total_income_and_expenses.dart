import 'package:flutter/material.dart';

class CustomTotalIncomeAndExpanses extends StatelessWidget {
  const CustomTotalIncomeAndExpanses({
    super.key,
    required this.total,
    required this.icon, required this.titleText,
  });
  final String titleText, total;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.5),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              titleText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            "\$ $total",
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
        )
      ],
    );
  }
}
