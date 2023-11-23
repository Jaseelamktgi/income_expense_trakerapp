import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense_trakerapp/core/color/colors.dart';
import 'package:income_expense_trakerapp/screens/onboarding_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay for 2 seconds and then navigate to the OnboardingScreen
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed('/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: defaultColor,
      body: SafeArea(child: Center(child: Text('mono', style: TextStyle(color: whiteText,fontSize: 50, fontWeight: FontWeight.bold),))),
    );
  }
}
