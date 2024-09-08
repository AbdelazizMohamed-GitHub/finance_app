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
  CategoryModel(name: 'food', image: AppImages.food, amount: 20),
  CategoryModel(
    name: 'shopping',
    image: AppImages.shopping,
    amount: 20,
  ),
  CategoryModel(name: 'transport', image: AppImages.transport, amount: 20),
  CategoryModel(name: 'education', image: AppImages.education, amount: 10),
  CategoryModel(name: 'health', image: AppImages.health, amount: 15),
  CategoryModel(name: 'housing', image: AppImages.housing, amount: 12),
  CategoryModel(name: 'clothing', image: AppImages.clothing, amount: 12),
  CategoryModel(name: 'charity', image: AppImages.charity, amount: 10),
  CategoryModel(name: 'investment', image: AppImages.investment, amount: 8),
  CategoryModel(name: 'other', image: AppImages.other, amount: 9),
];
