import 'package:flutter/material.dart';
import 'package:income_expense_trakerapp/core/color/colors.dart';

class Cards extends StatelessWidget {
  Cards({super.key});
  final TextEditingController _nameFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  width: 324,
                  height: 200,
                  decoration: BoxDecoration(
                    color: defaultColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Debit \n Card ',
                              style: TextStyle(
                                  color: whiteText,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Text('Mono',
                                style: TextStyle(
                                    color: whiteText,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                        Image.asset(
                          '/images/chip.png',
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('2234',
                                style: TextStyle(
                                    color: whiteText,
                                    fontWeight: FontWeight.w600)),
                            Text('2094',
                                style: TextStyle(
                                    color: whiteText,
                                    fontWeight: FontWeight.w600)),
                            Text('6243',
                                style: TextStyle(
                                    color: whiteText,
                                    fontWeight: FontWeight.w600)),
                            Text('1093',
                                style: TextStyle(
                                    color: whiteText,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            Text('IRVAN MOSES',
                                style: TextStyle(
                                    color: whiteText,
                                    )),
                            Spacer(),
                            Text('22/01',
                                style: TextStyle(
                                    color: whiteText,
                                    ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 2,
            child: Container(
              height: 200,
              color: Colors.amberAccent,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add your debit Card',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'This card must be connected to a bank account under your name',
                      style: TextStyle(color: greyText, fontSize: 13),
                    ),
                    TextFormField(
                      // controller: _nameFieldController,
                      style: TextStyle(
                        color: defaultColor,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: greyText,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: defaultColor,
                          ),
                        ),
                        labelText: 'NAME ON CARD',
                        labelStyle: TextStyle(
                          color: greyText,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    TextFormField(
                      // controller: _nameFieldController,
                      style: TextStyle(
                        color: defaultColor,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: greyText,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: defaultColor,
                          ),
                        ),
                        labelText: 'DEBIT CARD NUMBER',
                        labelStyle: TextStyle(
                          color: greyText,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    TextFormField(
                      // controller: _nameFieldController,
                      style: TextStyle(
                        color: defaultColor,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: greyText,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: defaultColor,
                          ),
                        ),
                        labelText: 'CVC',
                        labelStyle: TextStyle(
                          color: greyText,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    TextFormField(
                      // controller: _nameFieldController,
                      style: TextStyle(
                        color: defaultColor,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: greyText,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: defaultColor,
                          ),
                        ),
                        labelText: 'EXPIRATION MM/YY',
                        labelStyle: TextStyle(
                          color: greyText,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    TextFormField(
                      // controller: _nameFieldController,
                      style: TextStyle(
                        color: defaultColor,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: greyText,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: defaultColor,
                          ),
                        ),
                        labelText: 'ZIP',
                        labelStyle: TextStyle(
                          color: greyText,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
