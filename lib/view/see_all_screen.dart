import 'package:finance_app/view/widget/custom_home_list.dart';
import 'package:flutter/material.dart';

import 'package:finance_app/model/finance_model.dart';
import 'package:finance_app/view/widget/custom_finance_item.dart';

class SeeAllScreen extends StatelessWidget {
  const SeeAllScreen({
    super.key,
    required this.financeList,
  });
  final List<FinanceModel> financeList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'All Transation',
        ),
      ),
      body: CustomHomeList(list: financeList),
    );
  }
}
