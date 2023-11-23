import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense_trakerapp/db/models/transactions/transaction_model.dart';
import 'package:income_expense_trakerapp/db/models/user_profile/user_profile_model.dart';
import 'package:income_expense_trakerapp/screens/home_screen/home_screen.dart';
import 'package:income_expense_trakerapp/screens/login/login_screen.dart';
import 'package:income_expense_trakerapp/screens/main_screen/main_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:income_expense_trakerapp/db/models/transactions/transaction_model.dart';
import 'package:income_expense_trakerapp/screens/onboarding_screen/onboarding_screen.dart';
import 'package:income_expense_trakerapp/screens/profile_screen/profile_screen.dart';
import 'package:income_expense_trakerapp/screens/register/register_screen.dart';
import 'package:income_expense_trakerapp/screens/splash_screen/splash_screen.dart';
import 'package:income_expense_trakerapp/screens/statistics/statistics_screen.dart';
import 'package:income_expense_trakerapp/screens/wallet_screen/wallet_screen.dart';

Future<void> main() async{
  //____Ensure that the Flutter framework is initialized___
  WidgetsFlutterBinding.ensureInitialized();

  //_____initialise hive______
  await Hive.initFlutter();

  //_____register all type adapters_____
  if (!Hive.isAdapterRegistered(UserProfileAdapter().typeId)) {
    Hive.registerAdapter(UserProfileAdapter());
  }
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }
  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
    Hive.registerAdapter(CategoryTypeAdapter ());
  }

  
  //____________open box in hive_____
  await Hive.openBox<UserProfile>('user_profiles');
  await Hive.openBox<TransactionModel>('transaction_details');
  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Income&Expense Traker',
      theme: ThemeData(useMaterial3: false),
      
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/onboarding', page: () => OnboardingScreen()),
        GetPage(name: '/register', page: () => RegistrationPage()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/main', page: () => MainScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/statistics', page: () =>StatisticsScreen ()), 
        GetPage(name: '/wallet', page: () =>WalletScreen ()), 
        GetPage(name: '/profile', page: () => ProfileScreen()), 
        // GetPage(name: '/', page: () => ()), 
        // GetPage(name: '/', page: () => ()), 

      ],
      // home: MainScreen(),

      
    );
  }
}

