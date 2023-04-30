// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pamital_flutter_project/utils/constant/navigation_menu.dart';

void main() {
  runApp(const Pamital());
}

class Pamital extends StatelessWidget {
  const Pamital({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationMenu(index: 0),
    );
  }
}
