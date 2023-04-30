// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class SearchForm extends StatefulWidget {
  final String text;
  final String hintText;
  final ValueChanged<String> onChanged;
  const SearchForm(
      {super.key,
      required this.hintText,
      required this.onChanged,
      required this.text});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        suffixIcon: widget.text.isNotEmpty
            ? InkWell(
                child: Icon(Icons.close),
                onTap: () {
                  controller.clear();
                  widget.onChanged('');
                },
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onChanged: widget.onChanged,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.words,
    );
  }
}
