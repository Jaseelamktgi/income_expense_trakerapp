import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class TransactionDetailsController extends GetxController {
  var addedTransactionDetails = [].obs;

  void addDetails(String transactionName, String transactionDescription,
      String amount, String category) {
    List<String> addedDetails = [
      transactionName,
      transactionDescription,
      amount,
      category
    ];
    addedTransactionDetails.add(addedDetails);
    print('ADDED TRANSACTION DETAILS == $addedDetails');
  }
}



                  // onPressed: () async {
                  //   final _tansactionName = _nameController.text;
                  //   final _tansactionDescription = _descriptionController.text;
                  //   final _tansactionAmount = _amountController.text;

                  //   // Check if any of the required fields is empty
                  //   if (_tansactionName.isEmpty ||
                  //       _tansactionDescription.isEmpty ||
                  //       _tansactionAmount.isEmpty) {
                  //     // Show an error message or handle the empty fields as needed
                  //     return;
                  //   }
                  //   print('Transaction Name :$_tansactionName');
                  //   print('Transaction DEsc :$_tansactionDescription');
                  //   print('Transaction AMt :$_tansactionAmount');


                  //   final _type = selectedCategoryNotifier.value;
                  //   final _transaction = TransactionModel(
                  //       id: DateTime.now().millisecondsSinceEpoch.toString(),
                  //       name: _tansactionName,
                  //       amount: double.parse(_tansactionAmount),
                  //       description: _tansactionDescription,
                  //       type: _type);

                  //   print('TRANSACTION DEATILS == $_transaction');

                    // Insert the transaction into Hive
                    // await TransactionDB().insertTransactions(_transaction);

                    // Refresh UI to display the added transaction
                    // await TransactionDB().refreshUI();

                  //   Navigator.of(cntx).pop();
                  // },