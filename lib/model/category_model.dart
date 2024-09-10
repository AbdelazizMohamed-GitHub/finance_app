import 'package:finance_app/constnat.dart';

class CategoryModel {
  final String name;
  final String image;
  final int amount;

  CategoryModel(
      {required this.name, required this.image, required this.amount});
}

List<CategoryModel> cateoryList = [
  CategoryModel(name: 'Salary', image: AppImages.salary, amount: 20),
  CategoryModel(name: 'Food', image: AppImages.food, amount: 20),
  CategoryModel(
    name: 'Shopping',
    image: AppImages.shopping,
    amount: 20,
  ),
  CategoryModel(name: 'Transport', image: AppImages.transport, amount: 20),
  CategoryModel(name: 'Education', image: AppImages.education, amount: 10),
  CategoryModel(name: 'Health', image: AppImages.health, amount: 15),
  CategoryModel(name: 'Housing', image: AppImages.housing, amount: 12),
  CategoryModel(name: 'Clothing', image: AppImages.clothing, amount: 12),
  CategoryModel(name: 'Charity', image: AppImages.charity, amount: 10),
  CategoryModel(name: 'Investments', image: AppImages.investment, amount: 8),
  CategoryModel(name: 'other', image: AppImages.other, amount: 9),
];
