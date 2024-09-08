import 'package:hive_flutter/hive_flutter.dart';

part 'finance_model.g.dart';

@HiveType(typeId: 1)
class FinanceModel extends HiveObject {
  @HiveField(0)
  final String amount;
  @HiveField(1)
  final String category;
  @HiveField(2)
  final String type;
  @HiveField(3)
  final DateTime date;

  FinanceModel(
      {required this.amount,
      required this.category,
      required this.type,
      required this.date});
}
