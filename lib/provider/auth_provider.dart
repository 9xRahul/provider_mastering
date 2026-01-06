import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider_mastering/widgets/toast_messenger.dart';

class AuthProvider with ChangeNotifier {
  bool isLoading = false;

  bool _isObscure = false;

  bool get isObscure => _isObscure;

  void setLoading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  void setVisibility(bool visibility) {
    _isObscure = visibility;
    notifyListeners();
  }

  loginApi(String username, String password) async {
    Map<String, dynamic> result = {'message': "", "ststus": true};
    setLoading(true);
    try {
      final response = await http.post(
        Uri.parse('https://dummyjson.com/auth/login'),
        body: {'username': username, 'password': password},
      );

      Map res = jsonDecode(response.body);

      if (response.statusCode == 200) {
        String token = res['accessToken'];

        print(token);
        result['message'] = "login success";
        result['ststus'] = true;

        if (kDebugMode) {
          print(result['messgae']);
        }
        setLoading(false);
       // showToast("Login success", false);
      } else {
        result['message'] = res['message'];
        result['ststus'] = false;
        print("error");
        setLoading(false);
       // showToast(result['message'], true);
      }
    } catch (e) {
      result['message'] = e.toString();
      result['ststus'] = false;
      setLoading(false);
     // showToast(e.toString(), true);
    }
  }
}
