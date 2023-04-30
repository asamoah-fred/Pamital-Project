// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pamital_flutter_project/utils/custom/text_form_field.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController messageTextEditingController = TextEditingController();
  String? name, email, message, messages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 18),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFieldForm(
                  onChanged: (value) {
                    name = value;
                  },
                  textFieldForms: TextFormData(
                    hintText: 'name',
                    validator: (value) {
                      if (value!.isEmpty || value.length < 3) {
                        return "Please enter your name";
                      } else if (!RegExp(r"^\s*([A-Za-z --']{2,20})*$")
                          .hasMatch(value)) {
                        return "Please enter a valid name";
                      }
                    },
                  ),
                  keyBoard: TextInputType.name,
                  controller: nameTextEditingController,
                  textCapitalization: TextCapitalization.words,
                ),
                SizedBox(
                  height: 15,
                ),
                TextFieldForm(
                  onChanged: (value) {
                    email = value;
                  },
                  textFieldForms: TextFormData(
                    hintText: 'email',
                    validator: (value) {
                      if (value == null || value.trim().length == 0) {
                        return "Please enter your email";
                      } else if (!RegExp(
                              r"^\w+([\.\-\+]?\w*)*@\w+([\.-]?\w+)*(\.\w{2,3})+$")
                          .hasMatch(value)) {
                        return "Please enter a valid email";
                      }
                    },
                  ),
                  keyBoard: TextInputType.emailAddress,
                  controller: emailTextEditingController,
                  textCapitalization: TextCapitalization.none,
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  onChanged: (value) {
                    message = value;
                  },
                  controller: messageTextEditingController,
                  maxLines: 8,
                  minLines: 8,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 239, 236, 236),
                    hintText: 'massage',
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 3) {
                      return "Please enter your message";
                    } else if (!RegExp(r"^\s*([A-Za-z --']{2,20})*$")
                        .hasMatch(value)) {
                      return "Please enter a valid message";
                    }
                    return null;
                  },
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.multiline,
                ),
                SizedBox(
                  height: 80,
                ),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      emailTextEditingController.clear();
                      nameTextEditingController.clear();
                      messageTextEditingController.clear();
                      final snackBar = SnackBar(
                        backgroundColor: Colors.redAccent,
                        duration: Duration(seconds: 5),
                        content: Text('login successful'),
                        showCloseIcon: true,
                        closeIconColor: Colors.white,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.redAccent,
                    ),
                    child: Center(
                        child: Text(
                      "Send",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
