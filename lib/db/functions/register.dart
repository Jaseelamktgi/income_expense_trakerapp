import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:income_expense_trakerapp/core/color/colors.dart';
import 'package:income_expense_trakerapp/db/models/user_profile/user_profile_model.dart';

Future<void> onSubmit(String nameController, String usernameController,
    String emailController, String passwordController, String confirmPasswordController) async {
  {
    if (nameController.isEmpty ||
      usernameController.isEmpty ||
      passwordController.isEmpty ||
      confirmPasswordController.isEmpty) {
    _showError('All fields must be filled');
    return;
  }
  // Check if the password and confirm password match
    if (passwordController != confirmPasswordController) {
      _showError('Password and confirm password do not match');
      return;
    }

    try {
      // Create a UserProfile instance
      UserProfile userProfile = UserProfile(
        name: nameController,
        username: usernameController,
        email: emailController,
        password: passwordController,
      );

      print(nameController);
      print(userProfile);

      // Open the Hive box
      // final Box<UserProfile> userDataBox = Hive.box('user_profiles');
      final userDataBox = await Hive.openBox<UserProfile>('user_profiles');

      // Save the user profile to the box
      int addedIndex = await userDataBox.add(userProfile);

      // Close the box when done
      await userDataBox.close();

      if (addedIndex != -1) {
        // User profile added successfully
        print(
            'User profile added successfully at index $addedIndex: $userProfile');
        // Navigate to the login screen
        Get.toNamed('/login');
      } else {
        // Failed to add user profile
        print('Failed to add user profile');
      }
    } catch (e) {
      // Handle exceptions, e.g., log or display an error message
      print('Error adding user profile: $e');
      _showError('Error adding user profile');
    }
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
