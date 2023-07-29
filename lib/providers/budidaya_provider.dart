import 'package:flutter/cupertino.dart';
import 'package:shamo/models/budidaya_model.dart';
import 'package:shamo/services/budidaya_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BudidayaProvider with ChangeNotifier {
  List<BudidayaModel> _budidayas = [];
  List<BudidayaModel> get budidayas => _budidayas;
  set budidayas(List<BudidayaModel> budidayas) {
    _budidayas = budidayas;
    notifyListeners();
  }

  // Future<bool> autoLogin() async {
  //   try {
  //     final prefs = await SharedPreferences.getInstance();
  //     final login = await prefs.getBool('is_login');
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

  Future<void> getBudidayas() async {
    try {
      List<BudidayaModel> budidayas = await BudidayaService().getBudidaya();
      _budidayas = budidayas;
    } catch (e) {
      print(e);
    }
  }
}
