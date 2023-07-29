import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shamo/models/artikel_model.dart';

class ArtikelService {
  String baseUrl = 'budidaya.best';

  Future<List<ArtikelModel>> getArtikel() async {
    var params = {'jenis': '3'};
    var url = Uri.https('budidaya.best', '/api/budidaya', params);
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ArtikelModel> artikels = [];

      for (var item in data) {
        artikels.add(ArtikelModel.fromJson(item));
      }

      return artikels;
    } else {
      throw Exception('Gagal Get Budidaya!');
    }
  }
}
