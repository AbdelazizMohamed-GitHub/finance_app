import 'package:finance_app/constnat.dart';
import 'package:finance_app/cubits/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:finance_app/model/category_model.dart';
import 'package:finance_app/view/widget/custom_category_precent_list.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart' as fl;
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double totalBalance = BlocProvider.of<FetchDataCubit>(context).total;
    
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (_, __) => [
                SliverAppBar(actions: [],
                  expandedHeight: 320,
                  floating: true,
                  pinned: true,
                  title: const Text('Chart'),
                  snap: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                    color: Colors.blue,
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: fl.PieChart(
                          fl.PieChartData(
                              sections: cateoryList
                                  .map<fl.PieChartSectionData>((category) {
                            return fl.PieChartSectionData(
                              color: Colors.grey[300],
                              value: BlocProvider.of<FetchDataCubit>(context)
                                      .fetchCategorySum(category.name) /
                                  totalBalance,
                              title:
                                  ((BlocProvider.of<FetchDataCubit>(context).fetchCategorySum(category.name) / totalBalance) * 100).toStringAsFixed(2),
                              titleStyle:
                                  const TextStyle(fontSize: 20, color: Colors.black),
                              radius: 100,
                            );
                          }).toList()),
                        ),
                      ),
                    ),
                  ),
                )
              ],
          body: const CustomCategoryPrecentList()),
    );
  }
}
