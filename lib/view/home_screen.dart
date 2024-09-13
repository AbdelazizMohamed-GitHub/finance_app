
import 'package:finance_app/cubits/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:finance_app/model/finance_model.dart';
import 'package:finance_app/view/add_screen.dart';
import 'package:finance_app/view/see_all_screen.dart';
import 'package:finance_app/view/widget/custom_finance_item.dart';
import 'package:finance_app/view/widget/custom_home_balance.dart';
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
            return const AddScreen();
          }));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
      appBar: AppBar(
        title: const Text(
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
                      borderRadius: const BorderRadius.only(
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
                          const Text(
                            'Good Morning',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            '${Hive.box(kUserBox).get('username')}',
                            style: const TextStyle(fontSize: 24, color: Colors.white),
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
                      child: const CustomHomeBalance())
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
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
                      child: const Text(
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
                    return const Divider();
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
