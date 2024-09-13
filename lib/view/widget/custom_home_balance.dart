import 'package:finance_app/constnat.dart';
import 'package:finance_app/cubits/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:finance_app/view/widget/custom_total_income_and_expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomHomeBalance extends StatelessWidget {
  const CustomHomeBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: kPrimaryColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Balance",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "\$ ${BlocProvider.of<FetchDataCubit>(context).totalBalance}",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomTotalIncomeAndExpanses(
                                titleText: 'Income',
                                total: BlocProvider.of<FetchDataCubit>(context)
                                    .totalIncome
                                    .toString(),
                                icon: Icons.arrow_downward,
                              ),
                              CustomTotalIncomeAndExpanses(
                                titleText: 'Expenses',
                                total: BlocProvider.of<FetchDataCubit>(context)
                                    .totalExpense
                                    .toString(),
                                icon: Icons.arrow_upward,
                              )
                            ],
                          ),
                        ],
                      ),
                    );
  }
}