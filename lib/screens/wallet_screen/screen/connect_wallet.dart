import 'package:flutter/material.dart';
import 'package:income_expense_trakerapp/core/color/colors.dart';
import 'package:income_expense_trakerapp/screens/wallet_screen/widgets/account.dart';
import 'package:income_expense_trakerapp/screens/wallet_screen/widgets/cards.dart';
import 'package:income_expense_trakerapp/screens/widgets/bottom_navigation.dart';
import 'package:income_expense_trakerapp/screens/widgets/top_container_sqr.dart';

class ConnectWallet extends StatelessWidget {
  const ConnectWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TopContainerSqr(title: "Connect Wallet", icon: Icons.notifications),
        Column(
          children: [
            DefaultTabController(
              length: 2,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TabBar(
                        splashBorderRadius: BorderRadius.circular(30),
                        indicator: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.5), // Set the shadow color
                              spreadRadius: 5, // Set the spread radius
                              blurRadius: 7, // Set the blur radius
                              offset: Offset(0, 3), // Set the offset
                            ),
                          ],
                          borderRadius: BorderRadius.circular(
                              30.0), // Set border radius here
                          color: const Color.fromARGB(
                              255, 219, 217, 217), // Set tab indicator color
                        ),
                        tabs: [
                          Tab(
                            child: Text(
                              'Cards',
                              style: TextStyle(color: greyText),
                            ),
                          ),
                          Tab(
                            child: Text('Accounts',
                                style: TextStyle(color: greyText)),
                          ),
                        ]),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 430,
                      width: MediaQuery.of(context).size.width,
                      child: TabBarView(children: [Cards(), Accounts()]),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
      bottomNavigationBar: Container(
        child: BottomNavigationWidget(),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color.fromARGB(255, 239, 235, 235),
            ),
          ),
        ),
      ),
    );
  }
}
