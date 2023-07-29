import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shamo/models/budidaya_model.dart';

class BudidayaService {
  String baseUrl = 'budidaya.best';

  Future<List<BudidayaModel>> getBudidaya() async {
    var params = {'jenis': '1'};
    var url = Uri.https('budidaya.best', '/api/budidaya', params);
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<BudidayaModel> budidayas = [];

      for (var item in data) {
        budidayas.add(BudidayaModel.fromJson(item));
      }

      return budidayas;
    } else {
      throw Exception('Gagal Get Budidaya!');
    }
  }
}
