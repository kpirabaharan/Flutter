import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';
import '../keys/api_key.dart' as key;

class Auth with ChangeNotifier {
  late String _token;
  late DateTime _expiryDate;
  late String _userId;

  Future<void> _authenticate(
    String email,
    String password,
    String authUrl,
  ) async {
    final url = Uri.parse(authUrl);
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      print(responseData);

      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String email, String password) {
    return _authenticate(email, password,
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=${key.key}');
  }

  Future<void> login(String email, String password) {
    return _authenticate(email, password,
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${key.key}');
  }
}
