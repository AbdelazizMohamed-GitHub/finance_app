

import 'package:finance_app/constnat.dart';
import 'package:finance_app/cubits/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:finance_app/model/finance_model.dart';
import 'package:finance_app/observer.dart';
import 'package:finance_app/view/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<FinanceModel>(FinanceModelAdapter());
  await Hive.openBox<FinanceModel>(kBox);
  Bloc.observer = Observer();
  runApp(const FinanceApp());
}

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchDataCubit()..fetchData(),
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(fontSize: 26, color: Colors.white),
              backgroundColor: kPrimaryColor,
              centerTitle: true),
        ),
        home: const MainScreen(),
      ),
    );
  }
}
