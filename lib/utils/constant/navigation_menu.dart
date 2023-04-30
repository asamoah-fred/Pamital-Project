// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:pamital_flutter_project/views/about.dart';
import 'package:pamital_flutter_project/views/contact.dart';
import 'package:pamital_flutter_project/views/home.dart';


class NavigationMenu extends StatefulWidget {
  final int index;
  NavigationMenu({super.key, required this.index});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int? _selectedIndex;

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    About(),
    Contact(),
    
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.redAccent,
        unselectedFontSize: 14,
        selectedFontSize: 14,
        iconSize: 28,
        currentIndex: _selectedIndex!,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedItemColor: Color.fromRGBO(211, 206, 206, 1),
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page_outlined),
            label: 'Contact',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex!),
    );
  }
}
