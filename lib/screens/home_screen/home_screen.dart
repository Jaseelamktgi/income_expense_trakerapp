import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense_trakerapp/controller/controller.dart';
import 'package:income_expense_trakerapp/core/color/colors.dart';
import 'package:income_expense_trakerapp/screens/home_screen/widgets/add_transactions.dart';
import 'package:income_expense_trakerapp/screens/widgets/bottom_navigation.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UIRefreshController uiRefreshController =
      Get.put(UIRefreshController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UIRefreshController>(builder: (controller) {
      return Scaffold(
        body: Column(
          children: [
            Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: topContainerColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                height: 220,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Total Balance',
                          style: TextStyle(fontSize: 16, color: whiteText),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: Text(
                          "\₹2,879.0",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: whiteText),
                        ),
                      ),
                    ),
                    SizedBox(height: 33)
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 150, 22, 0),
                  child: Center(
                    child: Container(
                      width: 310,
                      height: 180,
                      decoration: BoxDecoration(
                        color: defaultColor,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 35, horizontal: 5),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      TextButton.icon(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.arrow_downward,
                                          color: whiteText,
                                        ),
                                        label: Text(
                                          'Income',
                                          style: TextStyle(
                                              color: whiteText, fontSize: 16),
                                        ),
                                      ),
                                      Text(
                                        '\ ₹3,9207',
                                        style: TextStyle(
                                            color: whiteText,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      TextButton.icon(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.arrow_upward,
                                          color: whiteText,
                                        ),
                                        label: Text(
                                          'Expense',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      Text(
                                        '\ ₹3,9207',
                                        style: TextStyle(
                                            color: whiteText,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
              child: Row(
                children: [
                  Text(
                    'Transactions History',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'See all',
                        style: TextStyle(
                          color: greyText,
                        ),
                      ))
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (uiRefreshController.transactionDetails.isEmpty) {
                    return Center(child: Text('No Transaction Found'));
                  } else {
                    final transaction =
                        uiRefreshController.transactionDetails[index];
                    DateTime transactionDate =
                        DateTime.fromMillisecondsSinceEpoch(
                      int.parse(transaction.id),
                    );
                    // Format the month and date (e.g., "Jan 01")
                    String monthWithDate =
                        DateFormat('MMM \n dd').format(transactionDate);

                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 3, 5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              12.0), // Adjust the radius as needed
                        ),
                        elevation: 2,
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 26,
                            backgroundColor: defaultColor,
                            child: Text(
                              monthWithDate,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          title: Text(
                            transaction.name,
                            style: TextStyle(fontSize: 18, color: defaultColor),
                          ),
                          subtitle: Text(
                            transaction.description,
                            style: TextStyle(color: greyText, fontSize: 15),
                          ),
                          trailing: Text(
                            '₹${transaction.amount.toString()}',
                            style: TextStyle(
                                color: transaction.type.index == 0
                                    ? Colors.green
                                    : Colors.red,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    );
                  }
                },
                itemCount: uiRefreshController.transactionDetails.length,
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showCategoryAddPopup(context);
          },
          child: Icon(Icons.add),
          backgroundColor: defaultColor,
        ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color.fromARGB(255, 239, 235, 235),
                ),
              ),
            ),
            child: BottomNavigationWidget()),
      );
    });
  }
}
