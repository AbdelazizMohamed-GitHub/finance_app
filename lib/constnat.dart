import 'package:finance_app/view/chart_screen.dart';
import 'package:finance_app/view/home_screen.dart';
import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xff02072F);
const String kBox = 'finance';
const String kUserBox = 'user';

final List screens = [const HomeScreen(), const ChartScreen()];

class AppImages {
  static const String charity = 'assets/images/Charity.png';
  static const String food = 'assets/images/Food.png';
  static const String clothing = 'assets/images/Clothing.png';
  static const String education = 'assets/images/Education.png';
  static const String health = 'assets/images/Health.png';
  static const String housing = 'assets/images/Housing.png';

  static const String investment = 'assets/images/Investments.png';
  static const String shopping = 'assets/images/Shopping.png';
  static const String transport = 'assets/images/Transport.png';

  static const String other = 'assets/images/other.png';
  static const String salary = 'assets/images/Salary.png';
}
