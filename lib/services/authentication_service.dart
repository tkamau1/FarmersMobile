import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/constants.dart';


class AuthenticationService {
  final String baseUrl = '${Constants.backendUrl}/users'; // Adjust endpoint as per your backend URL structure

  Future<List<dynamic>> readAllUsers() async {
    final url = '$baseUrl/'; // Construct the complete URL

    final response = await http.get(Uri.parse(url));


    if (response.statusCode == 200) {
      // If the server returns a 200 OK response
      List<dynamic> users = jsonDecode(response.body); // Decode JSON response
      return users;
    } else {
      // If there's an error or non-200 status code
      throw Exception('Failed to load users');
    }
  }

  Future<bool> register(String email, String password, String role) async {
    final url = '$baseUrl/register';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'role': role,
      }),
    );

    return response.statusCode == 201;
  }

  Future<bool> login(String email, String password) async {
    final url = '$baseUrl/login';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // body: jsonEncode(<String, String>{
      //   "emailAddress": email,
      //   "password": password,
      // }),
      body: jsonEncode(<String, String>{
        "emailAddress": "user@example.com",
        "password": "password123"
      }),
    );

    if (kDebugMode) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }

      return response.statusCode == 200;
  }
  
}