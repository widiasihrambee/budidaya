import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shamo/models/budidaya_model.dart';
import 'package:shamo/models/cuaca_model.dart';
import 'package:shamo/models/rekomendasi_model.dart';

class CuacaService {
  String baseUrl = 'v1.nocodeapi.com';

  Future<List<CuacaModel>> getCuaca() async {
    var params = {'lat': '1.473668', 'lon': '102.342195'};
    var url = Uri.https('v1.nocodeapi.com',
        '/dani251018/ow/VodbALCXfDdfKYLh/oneCallAPI', params);
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);
    if (jsonDecode(response.body)['code'] == 400) {
      List data = jsonDecode(response.body)['info']['daily'];
      List<CuacaModel> cuacas = [];

      for (var item in data) {
        cuacas.add(CuacaModel.fromJson(item));
      }

      return cuacas;
    } else {
      throw Exception('Gagal Get Cuaca!');
    }
  }
}
