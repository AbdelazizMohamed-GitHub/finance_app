import 'package:finance_app/constnat.dart';
import 'package:finance_app/view/main_screen.dart';
import 'package:finance_app/view/widget/custom_text_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CustomSplashButton extends StatefulWidget {
  const CustomSplashButton({super.key});

  @override
  State<CustomSplashButton> createState() => _CustomSplashButtonState();
}

class _CustomSplashButtonState extends State<CustomSplashButton> {
  TextEditingController? textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CustomTextForm(
              text: 'Enter Username',
              textController: textController,
              textType: TextInputType.text),
          const SizedBox(height: 20.0),
          MaterialButton(
            minWidth: double.infinity,
            height: 50,
            color: Colors.white,
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            onPressed: () {
              if (textController!.text.isNotEmpty) {
                Hive.box(kUserBox).put('username', textController!.text);
                Hive.box(kUserBox).put('isLogin', true);
                
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MainScreen();
                }));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.white,
                    content: Text(
                      'Please fill the username',
                      style: TextStyle(color: kPrimaryColor, fontSize: 18),
                    ),
                  ),
                );
              }
            },
            child: const Text(
              'Get Started',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
