import 'package:flutter/cupertino.dart';
import 'package:shamo/models/artikel_model.dart';
import 'package:shamo/services/artikel_service.dart';

class ArtikelProvider with ChangeNotifier {
  List<ArtikelModel> _artikels = [];
  List<ArtikelModel> get artikels => _artikels;
  set artikels(List<ArtikelModel> artikels) {
    _artikels = artikels;
    notifyListeners();
  }

  Future<void> getArtikels() async {
    try {
      List<ArtikelModel> artikels = await ArtikelService().getArtikel();
      _artikels = artikels;
    } catch (e) {
      print(e);
    }
  }
}
