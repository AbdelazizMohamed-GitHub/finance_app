import 'package:finance_app/constnat.dart';
import 'package:finance_app/cubits/add_data_cubit/add_data_cubit.dart';
import 'package:finance_app/cubits/fetch_data_cubit/fetch_data_cubit.dart';
import 'package:finance_app/model/finance_model.dart';
import 'package:finance_app/view/widget/custom_category_dropdown.dart';
import 'package:finance_app/view/widget/custom_text_form.dart';
import 'package:finance_app/view/widget/custom_time_picker.dart';
import 'package:finance_app/view/widget/custom_type_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  DateTime currentDate = DateTime.now();
  String type = '';
  String category = '';
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(233, 224, 224, 224),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: const Text(
            'Add Balance',
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white),
                  child: Column(children: [
                    const SizedBox(
                      height: 50,
                    ),
                    CustomTextForm(
                      text: 'Balance',
                      textController: amountController,
                      textType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomCategoryDropdown(
                      onChanged: (String? value) {
                        category = value!;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTypeDropdown(
                      onChanged: (String? value) {
                        type = value!;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTimePicker(onChanged: (DateTime? value) {
                      currentDate = value!;
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocProvider(
      create: (context) => AddDataCubit(),
      child: 
    BlocBuilder<AddDataCubit, AddDataState>(
        builder: (context, state) {
          return MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
            color: kPrimaryColor,
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            onPressed: () {
              if (amountController.text.isNotEmpty && type.isNotEmpty && category.isNotEmpty) {
                final financeModel = FinanceModel(
                  category: category,
                  amount:amountController.text, 
                  date: currentDate,
                  type: type,
                );
                context.read<AddDataCubit>().addData(financeModel);
                Navigator.pop(context);
                BlocProvider.of<FetchDataCubit>(context).fetchData();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please fill all fields'),
                  ),
                );
              }
            },
            child: const Text('Save',
                style: TextStyle(fontSize: 22, color: Colors.white)),
          );
        },
      ),
                 ) ]),
                )
              ],
            ),
          ],
        ),),);
  }
}
