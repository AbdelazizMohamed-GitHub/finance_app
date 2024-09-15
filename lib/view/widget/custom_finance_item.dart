import 'package:flutter/material.dart';

import 'package:finance_app/model/finance_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CustomFinanceItem extends StatelessWidget {
  const CustomFinanceItem({
    super.key,
    required this.financeModel,
    required this.index,
  });
  final List<FinanceModel> financeModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        width: 50,
        height: 60,
        fit: BoxFit.cover,
        'assets/images/${financeModel[index].category}.svg',
      ),
      title: Text(
        financeModel[index].category,
        style: const TextStyle(
          fontSize: 22,
        ),
      ),
      subtitle: Text(DateFormat.yMMMEd().format(financeModel[index].date)),
      trailing: Text(
        ' ${financeModel[index].amount}',
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }
}
