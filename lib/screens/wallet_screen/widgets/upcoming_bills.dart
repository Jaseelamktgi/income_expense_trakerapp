import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense_trakerapp/core/color/colors.dart';
import 'package:income_expense_trakerapp/screens/wallet_screen/screen/connect_wallet.dart';

class UpcomingBills extends StatelessWidget {
  const UpcomingBills({super.key});

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
      trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 175, 243, 227), // Set the button background color
              foregroundColor: Color.fromARGB(255, 4, 154, 159), // Set the text color
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Set the padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0), // Set the border radius
              ),
              elevation: 5, // Set the button elevation
            ),
        onPressed: (){
          Get.to(ConnectWallet());
        }, child: Text('Pay')),
    );
  }
}