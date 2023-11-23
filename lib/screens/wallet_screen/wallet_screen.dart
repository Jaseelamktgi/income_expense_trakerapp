import 'package:flutter/material.dart';
import 'package:income_expense_trakerapp/core/color/colors.dart';
import 'package:income_expense_trakerapp/screens/widgets/bottom_navigation.dart';
import 'package:income_expense_trakerapp/screens/widgets/top_container_sqr.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                    children: [
            TopContainerSqr(
              title: "Wallet",
              icon: Icons.notifications_none_outlined,
            ),
            Container(
                child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Total Balance',
                  style: TextStyle(fontSize: 16, color: greyText),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '\$2,548.00',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        WalletButtons(
                          icon: Icons.add,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text('Add')
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        WalletButtons(
                          icon: Icons.payment_outlined,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text("Pay")
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        WalletButtons(icon: Icons.send),
                        SizedBox(
                          height: 3,
                        ),
                        Text('Send')
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
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
                                        color: Colors.grey.withOpacity(
                                            0.5), // Set the shadow color
                                        spreadRadius: 5, // Set the spread radius
                                        blurRadius: 7, // Set the blur radius
                                        offset: Offset(0, 3), // Set the offset
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(
                                        30.0), // Set border radius here
                                    color: const Color.fromARGB(255, 219, 217,
                                        217), // Set tab indicator color
                                  ),
                                  tabs: [
                                    Tab(
                                      child: Text(
                                        'Transaction',
                                        style: TextStyle(color: greyText),
                                      ),
                                    ),
                                    Tab(
                                      child: Text('Upcoming Bills',
                                          style: TextStyle(color: greyText)),
                                    ),
                                  ]),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 260,
                                width: MediaQuery.of(context).size.width,
                                child: TabBarView(
                                    children: [
                                      
                                      ]),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ],
            ))
                    ],
                  ),
          )),
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

  Widget History() {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: defaultColor,
        // child: Image.asset(
        //   ''
        // ),
      ),
      title: Text(
        'Title',
        style: TextStyle(fontSize: 16),
      ),
      subtitle: Text(
        'time',
        style: TextStyle(color: greyText, fontSize: 13),
      ),
      trailing: Text(
        '\$52662',
        style: TextStyle(color: Colors.red, fontSize: 18),
      ),
    );
  }
}

class WalletButtons extends StatelessWidget {
  final IconData icon;

  const WalletButtons({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: defaultColor),
            shape: BoxShape.circle),
        child: IconButton.outlined(
            onPressed: () {},
            icon: Icon(
              icon,
              color: defaultColor,
            )));
  }
}
