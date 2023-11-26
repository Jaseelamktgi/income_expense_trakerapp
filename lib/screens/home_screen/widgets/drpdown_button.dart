import 'package:flutter/material.dart';
import 'package:income_expense_trakerapp/core/color/colors.dart';

class DropDownField extends StatefulWidget {
  const DropDownField({super.key});

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  String selectedCategoryType = 'Income';

  @override
  Widget build(BuildContext context) {
    return Container(
        child: DropdownButtonFormField<String>(
      value: selectedCategoryType,
      onChanged: (value) {
        setState(() {
          selectedCategoryType = value!;
        });
      },
      items:
          ['Income', 'Expense'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(color: defaultColor),
          ),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: 'Category Type',
        labelStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: greyText),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: defaultColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ));
  }
}