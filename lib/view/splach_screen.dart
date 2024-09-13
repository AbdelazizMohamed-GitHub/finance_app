
import 'package:finance_app/constnat.dart';
import 'package:finance_app/view/widget/custom_splash_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'
    as sp; 

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo
            Icon(
              Icons.account_balance_wallet_rounded, // Finance-related icon
              size: 100.0,
              color: Colors.white,
            ),
            SizedBox(height: 20.0),

            // App Name
            Text(
              'Finance App',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 10.0),

            // Tagline
            Text(
              'Manage Your Finances Smartly',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white70,
              ),
            ),

            SizedBox(height: 50.0),

            // Loading Spinner
            sp.SpinKitPianoWave(
              color: Colors.white,
              size: 50.0,
            ),
            SizedBox(height: 50.0),
            CustomSplashButton()
          ],
        ),
      ),
    );
  }
}
