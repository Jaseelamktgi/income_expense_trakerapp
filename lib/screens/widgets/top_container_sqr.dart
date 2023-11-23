import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense_trakerapp/core/color/colors.dart';

class TopContainerSqr extends StatelessWidget {
  const TopContainerSqr({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 160,
            decoration: BoxDecoration(
            color: defaultColor,
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/round.png',
                ),
                alignment: Alignment.topLeft,
                fit: BoxFit.fitHeight),
           ),
            child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    }, icon: Icon(Icons.arrow_back_ios,color: whiteText,)),
                Spacer(),
                Center(
                    child: Text(
                  title,
                  style: TextStyle(letterSpacing: 3, color: whiteText,fontWeight: FontWeight.bold,fontSize: 18),
                  textWidthBasis: TextWidthBasis.longestLine,
                )),
                Spacer(),
                IconButton(
                    onPressed: () {}, icon: Icon(icon,color: whiteText,))
              ],
            )
          ],
            ),
          );
  }
}