import 'package:flutter/cupertino.dart';
import 'package:shamo/models/artikel_model.dart';
import 'package:shamo/models/cuaca_model.dart';
import 'package:shamo/services/cuaca_service.dart';

class CuacaProvider with ChangeNotifier {
  List<CuacaModel> _cuacas = [];
  List<CuacaModel> get cuacas => _cuacas;
  set cuacas(List<CuacaModel> cuacas) {
    _cuacas = cuacas;
    notifyListeners();
  }

  Future<void> getCuacas() async {
    try {
      List<CuacaModel> cuacas = await CuacaService().getCuaca();
      _cuacas = cuacas;
    } catch (e) {
      print(e);
    }
  }
}
