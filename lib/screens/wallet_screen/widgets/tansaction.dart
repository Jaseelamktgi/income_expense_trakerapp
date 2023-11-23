import 'package:flutter/material.dart';
import 'package:income_expense_trakerapp/core/color/colors.dart';

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
     return ListTile(
      leading: CircleAvatar(
        backgroundColor: defaultColor,
          // child: Image.asset(
          //   ''
          // ),
          ),
      title: Text(
        'Title',
        style: TextStyle(fontSize: 16),
      ),
      subtitle: Text(
        'time',
        style: TextStyle(color: greyText,fontSize: 13),
      ),
      trailing: Text(
        '\$52662',
        style: TextStyle(color: Colors.red,fontSize: 18),
      ),
    );
  }
}