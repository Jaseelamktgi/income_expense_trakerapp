import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense_trakerapp/core/color/colors.dart';
import 'package:income_expense_trakerapp/db/models/transactions/transaction_model.dart';
import 'package:income_expense_trakerapp/screens/home_screen/widgets/edit_transaction.dart';
import 'package:intl/intl.dart';

class ViewAllTransactions extends StatefulWidget {
  const ViewAllTransactions({super.key, required this.transaction});
  final TransactionModel transaction;

  @override
  State<ViewAllTransactions> createState() => _ViewAllTransactionsState();
}

class _ViewAllTransactionsState extends State<ViewAllTransactions> {
  delete() {
    Get.defaultDialog(
      title: "Delete this Transaction ?",
      middleText: "",
      textConfirm: "Delete",
      textCancel: "Cancel",
      cancelTextColor: green,
      confirmTextColor: warning,
      onConfirm: () {
        widget.transaction.delete();
        Get.close(1);
      },
    );
  }

  edit() {
    Get.to(() => EditTransaction(transaction: widget.transaction));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Row(
          children: [
            Text(
              '${widget.transaction.title} ',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: defaultColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            Text('  ${widget.transaction.amount}',
                style: TextStyle(
                  color: green,
                ))
          ],
        ),
        subtitle:
            Text('${DateFormat.yMMMMd().format(widget.transaction.timestamp)}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: greyText,
                )),
        onTap: () {},
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                  onPressed: edit,
                  icon: Icon(
                    Icons.edit,
                    color: greyText,
                  )),
              IconButton(
                  onPressed: delete,
                  icon: Icon(
                    Icons.delete,
                    color: defaultColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
