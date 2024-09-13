// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:finance_app/cubits/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:finance_app/model/finance_model.dart';
import 'package:finance_app/view/add_screen.dart';
import 'package:finance_app/view/see_all_screen.dart';
import 'package:finance_app/view/widget/custom_finance_item.dart';
import 'package:finance_app/view/widget/custom_home_balance.dart';
import 'package:finance_app/view/widget/custom_total_income_and_expenses.dart';
import 'package:flutter/material.dart';

import 'package:finance_app/constnat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<FinanceModel> list =
        Hive.box<FinanceModel>(kBox).values.toList().reversed.toList();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddScreen();
          }));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Finance',
        ),
      ),
      body: BlocConsumer<FetchDataCubit, FetchDataState>(
        listener: (context, state) {
          if (state is FetchDataSuccess) {
            list = state.list.reversed.toList();
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.9),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good Morning',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            '${Hive.box(kUserBox).get('username')}',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.15,
                          left: 30,
                          right: 30),
                      child: CustomHomeBalance())
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transaction History",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SeeAllScreen(
                            financeList: list,
                          );
                        }));
                      },
                      child: Text(
                        'See all',
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: list.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onDoubleTap: () {
                          list[index].delete();
                         
                          BlocProvider.of<FetchDataCubit>(context).fetchData();
                        },
                        child: CustomFinanceItem(
                          financeModel: list,
                          index: index,
                        ));
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
