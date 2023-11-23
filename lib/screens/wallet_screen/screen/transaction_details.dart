import 'package:flutter/material.dart';
import 'package:income_expense_trakerapp/core/color/colors.dart';
import 'package:income_expense_trakerapp/screens/widgets/bottom_navigation.dart';
import 'package:income_expense_trakerapp/screens/widgets/top_container_sqr.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopContainerSqr(
            title: 'Transaction Details',
            icon: Icons.more_horiz,
          ),
          Column(
            children: [
              CircleAvatar(
                child: Image.asset(
                  '/images/income.png',
                  width: 65,
                  height: 65,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Income'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 204, 225, 243),
                  foregroundColor: defaultColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: EdgeInsets.all(12.0),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '\$24763',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Transaction details',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.keyboard_arrow_up))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Status',
                            style: TextStyle(
                              fontSize: 16,
                              color: greyText,
                            ),
                          ),
                          Text(
                            'Income',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'From',
                            style: TextStyle(
                              fontSize: 16,
                              color: greyText,
                            ),
                          ),
                          Text('Upwork koah')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Time',
                            style: TextStyle(
                              fontSize: 16,
                              color: greyText,
                            ),
                          ),
                          Text('10:00 AM')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date',
                            style: TextStyle(
                              fontSize: 16,
                              color: greyText,
                            ),
                          ),
                          Text('Feb 2 2023')
                        ],
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Earnings',
                            style: TextStyle(
                              fontSize: 16,
                              color: greyText,
                            ),
                          ),
                          Text('\$ 6382.09')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Free',
                            style: TextStyle(
                              fontSize: 16,
                              color: greyText,
                            ),
                          ),
                          Text('\$9920')
                        ],
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 16,
                              color: greyText,
                            ),
                          ),
                          Text('\$82993.09')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
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
  }
}
