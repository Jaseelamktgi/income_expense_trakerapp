import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:income_expense_trakerapp/core/color/colors.dart';
import 'package:income_expense_trakerapp/db/models/user_profile/user_profile_model.dart';

Future<void> onLogin(String emailController, String passwordController) async {
    String email = emailController;
    String password = passwordController;
    print('Email: $email, Password: $password');

    final userDataBox =  await Hive.openBox<UserProfile>('user_profiles');
    List<UserProfile> users = userDataBox.values.toList();
    var userIndex = users.indexWhere((user) =>
        user.email.toLowerCase() == email.toLowerCase() &&
        user.password == password);
        print(' USERINDEX $userIndex');

    await userDataBox.close();

    if (userIndex != -1) {
      Get.toNamed('/main');
    } else {
      _showError("Invalid email or password");
    }
  }
  
  void _showError(String errorMessage) {
    Get.snackbar(
      "Error",
      errorMessage,
      backgroundColor: warning,
      colorText: whiteText,
    );
  }