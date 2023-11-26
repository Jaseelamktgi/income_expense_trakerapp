import 'package:get/get.dart';

class TransactionController extends GetxController {
  List _transactions = [];

  List get transactions => _transactions;

  setTransactions(List data) {
    _transactions = data;
    update();
  }

  double get totalBalance {
    return _transactions.fold(0, (sum, transaction) {
      print(transaction.amount);
      return sum +
          (transaction.type == 'Income'
              ? transaction.amount
              :transaction.amount);
    });
  }

  double get totalIncome {
    return _transactions
        .where((transaction) => transaction.type == 'Income')
        .fold(0, (sum, transaction) => sum + transaction.amount);
  }

  double get totalExpense {
    return _transactions
        .where((transaction) => transaction.type == 'Expense')
        .fold(0, (sum, transaction) => sum + transaction.amount);
  }
}
