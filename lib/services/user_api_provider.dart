import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user.dart';

class UserProvider {
  // https://jsonplaceholder.typicode.com/users

  Future<List<User>> getUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Error');
    }
  }
}
