import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense_trakerapp/core/color/colors.dart';
import 'package:income_expense_trakerapp/db/models/transactions/transaction_model.dart';
import 'package:income_expense_trakerapp/screens/home_screen/widgets/drpdown_button.dart';
import 'package:income_expense_trakerapp/screens/widgets/inputField.dart';

class EditTransaction extends StatefulWidget {
  const EditTransaction({super.key, required this.transaction});
  final TransactionModel transaction;

  @override
  State<EditTransaction> createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController typeController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.transaction.title;
    descriptionController.text = widget.transaction.description;
    typeController.text = widget.transaction.type;
    amountController.text = widget.transaction.amount.toString();

    super.initState();
  }

  edit() {
    widget.transaction.edit(titleController.text, descriptionController.text,
        amountController.text, typeController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.all(10),
          children: [
            Row(
              children: [
                TextButton.icon(
                  onPressed: () {
                    Get.back();
                  },
                  label: Text('Edit Transaction',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: greyText,
                          fontWeight: FontWeight.w600,
                          fontSize: 20)),
                  icon: Icon(
                    Icons.arrow_back,
                    color: greyText,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            InputField(
                labelText: "Title", textEditingController: titleController),
            SizedBox(
              height: 20,
            ),
            InputField(
                labelText: "Description",
                textEditingController: descriptionController),
            SizedBox(
              height: 20,
            ),
            InputField(
                labelText: "Amount", textEditingController: amountController),
            SizedBox(
              height: 20,
            ),
            DropDownField(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    edit();
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: defaultColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text('Edit')),
            )
          ],
        ),
      ),
    );
  }
}