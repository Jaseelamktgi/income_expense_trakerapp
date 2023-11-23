import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:income_expense_trakerapp/core/color/colors.dart';
import 'package:income_expense_trakerapp/db/models/user_profile/user_profile_model.dart';

Future<void> onLogin(String emailController, String passwordController) async {
    // Add your login logic here
    String email = emailController;
    String password = passwordController;
    print('Email: $email, Password: $password');

    // Open the Hive box
    // final Box<UserProfile> userDataBox = Hive.box('user_profiles');
    final userDataBox =  await Hive.openBox<UserProfile>('user_profiles');

    // Convert values to a list and check if a user with the provided email exists
    List<UserProfile> users = userDataBox.values.toList();

    // Convert both email and stored email to lowercase for case-insensitive comparison
    var userIndex = users.indexWhere((user) =>
        user.email.toLowerCase() == email.toLowerCase() &&
        user.password == password);
        print(' USERINDEX $userIndex');

    // Close the box after checking
    await userDataBox.close();

    if (userIndex != -1) {
      // User found, navigate to home screen or perform the required action
      Get.toNamed('/main');
    } else {
      // User not found, show an error message
      _showError("Invalid email or password");
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