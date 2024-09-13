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
      body: ListView.separated(
        shrinkWrap: true,
        itemCount: financeList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          return CustomFinanceItem(
            financeModel: financeList,
            index: index,
          );
        },
      ),
    );
  }
}
