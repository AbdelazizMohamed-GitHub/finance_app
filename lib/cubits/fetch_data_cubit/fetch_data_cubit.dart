import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:finance_app/constnat.dart';
import 'package:finance_app/model/finance_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'fetch_data_state.dart';

class FetchDataCubit extends Cubit<FetchDataState> {
  FetchDataCubit() : super(FetchDataInitial());
  double totalExpense = 0.0;
  double totalIncome = 0.0;
  double totalBalance = 0.0;
  void fetchData() {
    try {
      totalExpense = 0.0;
      totalIncome = 0.0;
      totalBalance = 0.0;
      emit(FetchDataLoading());
      List<FinanceModel> dataList =
          Hive.box<FinanceModel>(kBox).values.toList();
      for (var element in dataList) {
        if (element.type == 'Expense') {
          totalExpense += double.parse(element.amount);
        } else {
          totalIncome += double.parse(element.amount);
        }

        totalBalance = totalIncome - totalExpense;
      }
      emit(FetchDataSuccess(list: dataList));
    } catch (e) {
      emit(FetchDataFailure(error: e.toString()));
    }
  }
}
