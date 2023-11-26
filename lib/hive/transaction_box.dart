import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:income_expense_trakerapp/controller/controller.dart';

class TransactionBox{
  getTransactions(){
    return Hive.box("transactions_box").get("transactions", defaultValue: []);
  }

  putTransactions(List data) async {
    final TransactionController transactionController = Get.find();
    await Hive.box("transactions_box").put("transactions", data);
    // List transactions = getTransactions();
    //  transactionController.setTransactions(transactions);
  }
}