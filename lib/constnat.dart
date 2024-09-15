import 'package:finance_app/view/chart_screen.dart';
import 'package:finance_app/view/home_screen.dart';
import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xff02072F);
const String kBox = 'finance';
const String kUserBox = 'user';

final List screens = [const HomeScreen(), const ChartScreen()];

String formatNumber(int number) {
  if (number >= 1000) {
    return '${(number / 1000).toStringAsFixed(1)}K';
  } else {
    return number.toString();
  }
}

class AppImages {
  static const String charity = 'assets/images/Charity.svg';
  static const String food = 'assets/images/Food.svg';
  static const String clothing = 'assets/images/Clothing.svg';
  static const String education = 'assets/images/Education.svg';
  static const String health = 'assets/images/Health.svg';
  static const String housing = 'assets/images/Housing.svg';

  static const String investment = 'assets/images/Investment.svg';
  static const String shopping = 'assets/images/Shopping.svg';
  static const String transport = 'assets/images/Transport.svg';

  static const String other = 'assets/images/other.svg';
  static const String salary = 'assets/images/Salary.svg';
}
