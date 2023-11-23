import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense_trakerapp/core/color/colors.dart';
import 'package:income_expense_trakerapp/screens/wallet_screen/screen/transaction_details.dart';

class Accounts extends StatefulWidget {
  Accounts({super.key});

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  int selectedCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InkWell(
            child: CardsList(
                0,
                "Bank Link",
                'Connect your bank account to deposit & fund',
                Icons.account_balance),
          ),
          InkWell(
            child: CardsList(
                1, 'Microdeposits', 'Connect bank in 5-7 days', Icons.paid),
          ),
          InkWell(
            child: CardsList(
                2, "Paypal", "Connect you paypal account", Icons.paypal),
          ),
          SizedBox(
            height: 50,
          ),
          TextButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  BorderSide(
                    color: defaultColor,
                    width: 1,
                  ),
                ),
                minimumSize: MaterialStateProperty.all(Size(250, 70)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              onPressed: () {
                Get.to(TransactionDetails());
              },
              child: Text(
                'Next',
                style: TextStyle(color: defaultColor),
              ))
        ],
      ),
    );
  }

  Widget CardsList(int index, String title, String subtitle, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        elevation: selectedCardIndex == index ? 5 : 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: selectedCardIndex == index ? defaultColor : whiteText,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: 380,
          height: 60,
          decoration: BoxDecoration(
            boxShadow: selectedCardIndex == index
                ? [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ]
                : null,
          ),
          child: ListTile(
            selectedTileColor:
                selectedCardIndex == index ? defaultColor : greyText,
            leading: Icon(icon,
                color: selectedCardIndex == index ? defaultColor : greyText),
            title: Text(
              title,
              style: TextStyle(
                  color: selectedCardIndex == index ? defaultColor : greyText,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(subtitle,
                style: TextStyle(
                    color: selectedCardIndex == index ? defaultColor : greyText,
                    fontSize: 12)),
            trailing: selectedCardIndex == index
                ? Icon(
                    Icons.check_circle,
                    color: defaultColor,
                  )
                : null,
            onTap: () {
              setState(() {
                selectedCardIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
