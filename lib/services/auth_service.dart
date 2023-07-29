import 'dart:convert';

import 'package:shamo/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String baseUrl = 'https://budidaya.best/api';

  Future<UserModel> register(
      {required String name,
      required String email,
      required String password}) async {
    var url = Uri.https('budidaya.best', '/api/register');
    var headers = {'Content-Type': 'application/json'};
    var body = {'name': name, 'email': email, 'password': password};

    var response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login(
      {required String email, required String password}) async {
    var url = Uri.https('budidaya.best', '/api/login');
    var headers = {'Content-Type': 'application/json'};
    var body = {'email': email, 'password': password};

    var response = await http.post(url, body: body);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];
      await prefs.setBool('is_login', true);
      getLogin(user);
      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }

  void getLogin(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('id', user.id ?? 0);
    await prefs.setString('name', user.name ?? '');
    await prefs.setString('email', user.email ?? '');
    await prefs.setString('token', user.token ?? '');
    await prefs.setString('login', 'ya');
  }
}
