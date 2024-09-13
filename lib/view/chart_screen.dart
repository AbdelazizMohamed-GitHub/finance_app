import 'package:finance_app/constnat.dart';
import 'package:finance_app/cubits/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:finance_app/model/category_model.dart';
import 'package:finance_app/view/widget/custom_category_chart.dart';
import 'package:finance_app/view/widget/custom_category_precent_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  bool showName = false;
  @override
  Widget build(BuildContext context) {
    double totalBalance = BlocProvider.of<FetchDataCubit>(context).total;

    return Scaffold(
      body: totalBalance == 0
          ? const Center(
              child: Text(
              'No data',
              style: TextStyle(fontSize: 20),
            ))
          : NestedScrollView(
              headerSliverBuilder: (_, __) => [
                    SliverAppBar(
                      actions: [
                        PopupMenuButton(
                            onSelected: (value) {
                              setState(() {
                                showName = value;
                              });
                            },
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.white,
                              size: 30,
                            ),
                            itemBuilder: (context) {
                              return [
                                const PopupMenuItem(
                                  value: true,
                                  child: Text('Show name'),
                                ),
                                const PopupMenuItem(
                                  value: false,
                                  child: Text('Show value'),
                                )
                              ];
                            }),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                      expandedHeight: 320,
                      floating: true,
                      pinned: true,
                      title: const Text('Chart'),
                      snap: true,
                      flexibleSpace: FlexibleSpaceBar(
                        background: CustomCategoryChart(
                            totalBalance: totalBalance, showName: showName),
                      ),
                    )
                  ],
              body: const CustomCategoryPrecentList()),
    );
  }
}
