import 'package:flutter/material.dart';
import 'package:income_expense_trakerapp/screens/home_screen/home_screen.dart';
import 'package:income_expense_trakerapp/screens/profile_screen/profile_screen.dart';
import 'package:income_expense_trakerapp/screens/statistics/statistics_screen.dart';
import 'package:income_expense_trakerapp/screens/wallet_screen/wallet_screen.dart';
import 'package:income_expense_trakerapp/screens/widgets/bottom_navigation.dart';

class MainScreen extends StatelessWidget {
   MainScreen({super.key});

  final _screens =[
    HomeScreen(),
    StatisticsScreen(),
    WalletScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNofifier,
       builder: (context,int index, _){
        return _screens[index];
       });
  }
}