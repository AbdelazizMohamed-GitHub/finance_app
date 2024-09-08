import 'package:finance_app/constnat.dart';
import 'package:finance_app/model/category_model.dart';
import 'package:finance_app/view/widget/custom_category_dropdown.dart';
import 'package:finance_app/view/widget/custom_text_form.dart';
import 'package:finance_app/view/widget/custom_type_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  DateTime data = DateTime.now();

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
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const CustomTextForm(
                        text: 'Balance',
                        textController: null,
                        textType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const CustomCategoryDropdown(),
                     const SizedBox(
                        height: 15,
                      ),
                      CustomTypeDropdown(),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () async {
                          DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: data,
                              firstDate: DateTime(2024),
                              lastDate: DateTime(2100));
                          if (newDate != null) {
                            setState(() {
                              data = newDate;
                            });
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(16)),
                          child: Text(
                            DateFormat.yMMMEd().format(data),
                            style: const TextStyle(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 5),
                        color: kPrimaryColor,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),
                        onPressed: () {},
                        child: const Text('Save',
                            style:
                                TextStyle(fontSize: 22, color: Colors.white)),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
