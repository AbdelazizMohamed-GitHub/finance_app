import 'package:finance_app/view/widget/custom_category_precent_list.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart' as fl;

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chart'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            child: fl.PieChart(
              fl.PieChartData(
                sections: [
                  fl.PieChartSectionData(
                    color: Colors.red,
                    value: 20,
                    radius: 100,
                  ),
                  fl.PieChartSectionData(
                    color: Colors.blue,
                    value: 30,
                    radius: 100,
                  ),
                  fl.PieChartSectionData(
                    color: Colors.green,
                    value: 50,
                    radius: 100,
                  ),
                ],
              ),
            ),
          ),
          const Expanded(child:  CustomCategoryPrecentList(),),
        ],
      ),
    );
  }
}
