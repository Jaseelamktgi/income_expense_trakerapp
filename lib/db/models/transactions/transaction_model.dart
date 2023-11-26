import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:income_expense_trakerapp/controller/controller.dart';
import 'package:income_expense_trakerapp/hive/transaction_box.dart';
part 'transaction_model.g.dart';

@HiveType(typeId: 1)
class TransactionModel {
  @HiveField(0)
  final id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  int amount;

  @HiveField(4)
  String type;

   @HiveField(5)
  DateTime timestamp;

  TransactionModel(
      {required this.id,
      required this.title,
      required this.amount,
      required this.description,
      required this.type,
      required this.timestamp});

  add() {
    final TransactionController transactionController = Get.find();
    List transactions = transactionController.transactions;
    transactions.add(this);
    TransactionBox().putTransactions(transactions);
    Get.snackbar("Add", "Success", snackPosition: SnackPosition.TOP);
    Get.close(1);
  }

  delete() {
    final TransactionController transactionController =
        Get.put(TransactionController());
    List transactions = transactionController.transactions;
    transactions.remove(this);
    TransactionBox().putTransactions(transactions);
    Get.snackbar("Delete", "Success",
        snackPosition: SnackPosition.TOP, duration: Duration(seconds: 1));
  }

  edit(String title, String description, String categoryType, String amount) {
    this.title = title;
    this.description = description;
    this.amount = int.parse(amount);
    this.type =categoryType;
    final TransactionController transactionController =
        Get.put(TransactionController());
    List transactions = transactionController.transactions;
    transactions[this.id] = this;
    TransactionBox().putTransactions(transactions);
    Get.close(1);
    Get.snackbar("Edit", "Success", snackPosition: SnackPosition.TOP);
  }
}
