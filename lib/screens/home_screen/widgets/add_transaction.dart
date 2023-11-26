import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense_trakerapp/controller/controller.dart';
import 'package:income_expense_trakerapp/core/color/colors.dart';
import 'package:income_expense_trakerapp/db/models/transactions/transaction_model.dart';
import 'package:income_expense_trakerapp/screens/home_screen/widgets/drpdown_button.dart';
import 'package:income_expense_trakerapp/screens/widgets/inputField.dart';

class AddTransactions extends StatefulWidget {
  const AddTransactions({super.key});

  @override
  State<AddTransactions> createState() => _AddTransactionsState();
}

class _AddTransactionsState extends State<AddTransactions> {
  final TransactionController transactionController =
      Get.put(TransactionController());

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  add() {
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        amountController.text.isEmpty) {
      Get.snackbar("Warning", "All fields must be filled",
          snackPosition: SnackPosition.TOP);
      return;
    }
    try {
      TransactionModel transaction = TransactionModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: titleController.text,
        description: descriptionController.text,
        amount: int.parse(amountController.text),
        type: typeController.text,
        timestamp:DateTime.now()
      );
      transaction.add();
      Get.back();
    } catch (err) {
      print('Error adding transaction: $err');
      Get.snackbar("Warning", "Error Adding Transaction",
          snackPosition: SnackPosition.TOP);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(10),
            scrollDirection: Axis.vertical,
            children: [
              Text(
                'Add Transactions',
                style: TextStyle(
                    color: greyText, fontWeight: FontWeight.w600, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              InputField(
                  labelText: "Title", textEditingController: titleController),
              SizedBox(
                height: 10,
              ),
              InputField(
                  labelText: "Description",
                  textEditingController: descriptionController),
              SizedBox(
                height: 10,
              ),
              InputField(
                  labelText: "Amount", textEditingController: amountController),
              SizedBox(
                height: 10,
              ),
              DropDownField(),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      add();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: defaultColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text('Add')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}