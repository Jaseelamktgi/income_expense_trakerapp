import 'package:flutter/material.dart';
import 'package:income_expense_trakerapp/core/color/colors.dart';

ValueNotifier<int> indexChangeNofifier =
    ValueNotifier(0); 

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNofifier,
      builder: (context,int newIndex, _) {
        return BottomNavigationBar(
          currentIndex: newIndex,
          onTap: (index) {
            indexChangeNofifier.value = index;
          },
          selectedItemColor:defaultColor,
          unselectedItemColor: Colors.grey,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(color: defaultColor),
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,size: 30,), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.signal_cellular_alt,size: 30, ), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.wallet,size: 30,), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person,size: 30,), label: ''),
           
          ],
        );
      },
    );
  }
}
