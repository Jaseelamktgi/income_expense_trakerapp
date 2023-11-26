import 'package:flutter/material.dart';
import 'package:income_expense_trakerapp/core/color/colors.dart';

class InputField extends StatefulWidget {
  final String labelText;
  final TextEditingController textEditingController;
  const InputField(
      {super.key,
      required this.labelText,
      required this.textEditingController});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        cursorColor: defaultColor,
        controller: widget.textEditingController,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
          color: defaultColor,
        ),
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            color: greyText,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: defaultColor),
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
