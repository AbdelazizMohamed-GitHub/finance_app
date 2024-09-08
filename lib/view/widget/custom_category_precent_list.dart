import 'package:finance_app/constnat.dart';
import 'package:finance_app/model/category_model.dart';
import 'package:finance_app/view/widget/custom_category_precent_item.dart';
import 'package:flutter/material.dart';

class CustomCategoryPrecentList extends StatelessWidget {
  const CustomCategoryPrecentList({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: cateoryList.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        return CustomCategoryPrecentItem(
          amount: cateoryList[index].amount,
          image: cateoryList[index].image,
          categoryName: cateoryList[index].name.toString(),
        );
      },
    );
  }
}
