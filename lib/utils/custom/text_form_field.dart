// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class TextFieldForm extends StatelessWidget {
  const TextFieldForm(
      {super.key,
      required this.textFieldForms,
      required this.onChanged,
      required this.keyBoard,
      required this.controller,
      required this.textCapitalization});
  final ValueChanged<String>? onChanged;
  final TextEditingController controller;
  final TextFormData textFieldForms;
  final dynamic keyBoard;
  final dynamic textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: textCapitalization,
      controller: controller,
      onChanged: onChanged,
      validator: textFieldForms.validator,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 25),
        fillColor: Color.fromARGB(255, 239, 236, 236),
        filled: true,
        hintText: textFieldForms.hintText,
        hintStyle: TextStyle(
            color: Color.fromRGBO(85, 84, 84, 1),
            fontSize: 16,
            fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Color.fromRGBO(142, 131, 131, 1),
          ),
        ),
      ),
      keyboardType: keyBoard,
    );
  }
}

class TextFormData {
  String hintText;
  dynamic validator;

  TextFormData({
    required this.hintText,
    required this.validator,
  });
}

List<TextFormData> textFieldForms = [
  TextFormData(
    hintText: '',
    validator: '',
  ),
];
