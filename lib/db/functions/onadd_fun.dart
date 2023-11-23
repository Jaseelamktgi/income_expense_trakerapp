import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:income_expense_trakerapp/controller/controller.dart';
import 'package:income_expense_trakerapp/core/color/colors.dart';
import 'package:income_expense_trakerapp/db/models/transactions/transaction_model.dart';
import 'package:income_expense_trakerapp/screens/home_screen/widgets/add_transactions.dart';

Future<void> onAddTransaction(String _nameController,
    String _descriptionController, String _amountController) async {
  // Check if any of the required fields is empty
  if (_nameController.isEmpty ||
      _descriptionController.isEmpty ||
      _amountController.isEmpty) {
    _showError('All fields must be filled');
    return;
  }

  try {
    final _type = selectedCategoryNotifier.value;
    TransactionModel transaction = TransactionModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: _nameController,
      amount: int.parse(_amountController),
      description: _descriptionController,
      type: _type,
    );

    // Open the Hive box
    final transactionsBox =
        await Hive.openBox<TransactionModel>('transaction_details');

    // Save the transaction to the box
    int addedIndex = await transactionsBox.add(transaction);
    

    // Close the box when done
    await transactionsBox.close();

    if (addedIndex != -1) {
      print(
          'User profile added successfully at index $addedIndex: $transaction');

      Get.back(); 
    } else {
      print('Failed to add transaction details');
    }
  } catch (e) {
    // Handle exceptions, e.g., log or display an error message
    print('Error adding transaction: $e');
    _showError('Error adding transaction');
  }
}

void _showError(String errorMessage) {
  // Show error message using a Flutter toast or any other method you prefer
  Get.snackbar(
    "Error",
    errorMessage,
    backgroundColor: warning,
    colorText: whiteText,
  );
}
