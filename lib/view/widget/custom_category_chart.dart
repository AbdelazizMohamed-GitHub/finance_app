import 'package:fl_chart/fl_chart.dart' as fl;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:finance_app/model/category_model.dart';

import '../../cubits/fetch_data_cubit/fetch_data_cubit.dart';

class CustomCategoryChart extends StatelessWidget {
  const CustomCategoryChart({
    super.key,
    required this.totalBalance,
    required this.showName,
  });
  final bool showName;
  final double totalBalance;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: fl.PieChart(
          fl.PieChartData(
              sections: cateoryList.map<fl.PieChartSectionData>((category) {
            return fl.PieChartSectionData(
              color: Colors.grey[300],
              value: BlocProvider.of<FetchDataCubit>(context)
                      .fetchCategorySum(category.name) /
                  totalBalance,
              title: showName
                  ? category.name.toString()
                  : '${((BlocProvider.of<FetchDataCubit>(context).fetchCategorySum(category.name) / totalBalance) * 100).toStringAsFixed(1)}%',
              titleStyle: const TextStyle(fontSize: 20, color: Colors.black),
              radius: 100,
            );
          }).toList()),
        ),
      ),
    );
  }
}
