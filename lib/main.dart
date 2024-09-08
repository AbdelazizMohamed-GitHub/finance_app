import 'package:finance_app/constnat.dart';
import 'package:finance_app/model/finance_model.dart';
import 'package:finance_app/view/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main()async {
  await Hive.initFlutter();
  Hive.registerAdapter<FinanceModel>(FinanceModelAdapter());
  await Hive.openBox<FinanceModel>(kBox);
  runApp(const FinanceApp());
}

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(fontSize: 26, color: Colors.white),
            backgroundColor: kPrimaryColor,
            centerTitle: true),
      ),
      home: const MainScreen(),
    );
  }
}
