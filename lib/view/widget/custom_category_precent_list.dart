import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:finance_app/cubits/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:finance_app/model/category_model.dart';
import 'package:finance_app/view/widget/custom_category_precent_item.dart';

class CustomCategoryPrecentList extends StatelessWidget {
  const CustomCategoryPrecentList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: cateoryList.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        return CustomCategoryPrecentItem(
          amount: BlocProvider.of<FetchDataCubit>(context)
              .fetchCategorySum(cateoryList[index].name),
          image: cateoryList[index].image,
          categoryName: cateoryList[index].name.toString(),
        );
      },
    );
  }
}
