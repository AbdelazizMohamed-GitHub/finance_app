import 'package:finance_app/constnat.dart';
import 'package:finance_app/cubits/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomCategoryPrecentItem extends StatelessWidget {
  const CustomCategoryPrecentItem(
      {super.key,
      required this.amount,
      required this.image,
      required this.categoryName});
  final String image;
  final String categoryName;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        image,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
      ),
      title: Text(
        categoryName,
        style: const TextStyle(fontSize: 20),
      ),
      subtitle: LinearProgressIndicator(
        value: amount / BlocProvider.of<FetchDataCubit>(context).totalBalance,
        backgroundColor: Colors.grey[400],
        minHeight: 10,
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
      trailing: SizedBox(
        width: 60,
        child: Text(
          textAlign: TextAlign.end,
          formatNumber(amount.toInt()),
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
