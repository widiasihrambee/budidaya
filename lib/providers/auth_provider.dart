import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register(
      {required String name,
      required String email,
      required String password}) async {
    try {
      UserModel user = await AuthService()
          .register(name: name, email: email, password: password);
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({required String email, required String password}) async {
    try {
      UserModel user =
          await AuthService().login(email: email, password: password);
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void autoLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final id = pref.getInt('id');
    final name = pref.getString('name');
    final email = pref.getString('email');
    final token = pref.getString('token');
    UserModel user = UserModel.fromJson({
      'id': id,
      'name': name,
      'email': email,
      'token': token,
    });
    _user = user;
  }

  Future<bool> logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    return true;
  }
}
