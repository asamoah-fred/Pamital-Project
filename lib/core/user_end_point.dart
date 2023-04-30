// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class UsersApi {
  static Future<List<User>> getUsers(String query) async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/users");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List users = json.decode(response.body);

      return users.map((json) => User.fromJson(json)).where((user) {
        final userName = user.name.toLowerCase();
        final search = query.toLowerCase();

        return userName.contains(search);
      }).toList();
    } else {
      throw Exception();
    }
  }
}

class User {
  final String name;
  final dynamic email;
  final String phone;

  const User({
    required this.name,
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'].toString(),
        email: json["email"],
        phone: json['phone'].toString(),
      );
}
