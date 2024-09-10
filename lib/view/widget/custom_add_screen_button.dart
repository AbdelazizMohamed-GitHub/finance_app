// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:finance_app/constnat.dart';
import 'package:finance_app/cubits/add_data_cubit/add_data_cubit.dart';
import 'package:finance_app/cubits/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:finance_app/model/finance_model.dart';

class CustomAddScreenButton extends StatelessWidget {
  const CustomAddScreenButton({
    required this.category,
    required this.data,
    required this.amount,
    required this.type,
  });
  final String amount, type, category;
  final DateTime data;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddDataCubit(),
      child: BlocBuilder<AddDataCubit, AddDataState>(
        builder: (context, state) {
          return MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
            color: kPrimaryColor,
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            onPressed: () {
              if (amount.isNotEmpty && type.isNotEmpty && category.isNotEmpty) {
                final financeModel = FinanceModel(
                  category: category,
                  amount: amount,
                  date: data,
                  type: type,
                );
                context.read<AddDataCubit>().addData(financeModel);
                Navigator.pop(context);
                BlocProvider.of<FetchDataCubit>(context).fetchData();
              } else if(amount.isEmpty && type.isEmpty && category.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please fill all fields'),
                  ),
                );
              }
            },
            child: const Text('Save',
                style: TextStyle(fontSize: 22, color: Colors.white)),
          );
        },
      ),
    );
  }
}
