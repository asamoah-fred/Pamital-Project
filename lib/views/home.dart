// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pamital_flutter_project/core/user_end_point.dart';
import 'package:pamital_flutter_project/utils/custom/search_form.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query = '';

  List<User> users = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    final users = await UsersApi.getUsers(query);

    setState(() {
      this.users = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSearch(),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];

                    return buildUser(user);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUser(User user) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${user.email}",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black45,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              user.phone,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearch() => SearchForm(
        hintText: 'Search',
        text: query,
        onChanged: searchUser,
      );

  Future searchUser(String query) async {
    final users = await UsersApi.getUsers(query);

    if (!mounted) return;

    setState(() {
      this.query = query;
      this.users = users;
    });
  }
}
