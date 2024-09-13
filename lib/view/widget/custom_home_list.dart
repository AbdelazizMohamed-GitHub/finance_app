// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:finance_app/cubits/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:finance_app/model/finance_model.dart';
import 'package:finance_app/view/widget/custom_finance_item.dart';

class CustomHomeList extends StatelessWidget {
  const CustomHomeList({
    super.key,
    required this.list,
  });
final List<FinanceModel> list;
  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
                  itemCount: list.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Delete'),
                                  content: const Text('Are you sure?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('No'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        list[index].delete();
                                        BlocProvider.of<FetchDataCubit>(context)
                                            .fetchData();
                                      },
                                      child: const Text('Yes'),
                                    )
                                  ],
                                );
                              });
                        },
                        child: CustomFinanceItem(
                          financeModel: list,
                          index: index,
                        ));
                  },
                );
  }
}
