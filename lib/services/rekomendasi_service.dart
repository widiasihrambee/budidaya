import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shamo/models/budidaya_model.dart';
import 'package:shamo/models/rekomendasi_model.dart';

class RekomendasiService {
  String baseUrl = 'budidaya.best';

  Future<List<RekomendasiModel>> getRekomendasi() async {
    var params = {'jenis': '2'};
    var url = Uri.https('budidaya.best', '/api/budidaya', params);
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<RekomendasiModel> rekomendasis = [];

      for (var item in data) {
        rekomendasis.add(RekomendasiModel.fromJson(item));
      }

      return rekomendasis;
    } else {
      throw Exception('Gagal Get Budidaya!');
    }
  }
}
