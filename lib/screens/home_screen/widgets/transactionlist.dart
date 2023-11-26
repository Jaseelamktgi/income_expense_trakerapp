import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense_trakerapp/controller/controller.dart';
import 'package:income_expense_trakerapp/core/color/colors.dart';
import 'package:income_expense_trakerapp/hive/transaction_box.dart';
import 'package:income_expense_trakerapp/screens/home_screen/widgets/add_transaction.dart';
import 'package:income_expense_trakerapp/screens/widgets/view_transaction.dart';

class TransactionsList extends StatefulWidget {
  const TransactionsList({
    super.key,
  });

  @override
  State<TransactionsList> createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  getTransactions() async {
    final TransactionController transactionController =
        Get.put(TransactionController());
    await transactionController
        .setTransactions(TransactionBox().getTransactions());
  }

  @override
  void initState() {
    getTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder(
        builder: (TransactionController transactionController) {
          return transactionController.transactions.length == 0
              ? Center(
                  child: const Text(
                    "No data found !",
                    style: TextStyle(
                        color: greyText,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                )
              : ListView.builder(
                  itemCount: transactionController.transactions.length,
                  itemBuilder: (context, index) {
                    return ViewAllTransactions(
                        transaction: transactionController.transactions[index]);
                  });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddTransactions());
        },
        child: Icon(Icons.add, color: whiteText),
        backgroundColor: defaultColor,
      ),
    );
  }
}