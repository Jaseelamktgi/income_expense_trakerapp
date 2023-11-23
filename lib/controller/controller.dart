import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:income_expense_trakerapp/db/models/transactions/transaction_model.dart';

class UIRefreshController extends GetxController {
  List<TransactionModel> transactionDetails = <TransactionModel>[].obs;
   

  @override
  void onInit() {
    super.onInit();
    _loadAllTransactions();
  }

  Future<void> _loadAllTransactions() async {
    final transactionBox =
        await Hive.openBox<TransactionModel>('transaction_details');
    transactionDetails = transactionBox.values.toList();
    print(transactionDetails.length);
  }
}
