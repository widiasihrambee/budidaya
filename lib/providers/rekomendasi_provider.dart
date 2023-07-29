import 'package:flutter/cupertino.dart';
import 'package:shamo/models/rekomendasi_model.dart';
import 'package:shamo/services/rekomendasi_service.dart';

class RekomendasiProvider with ChangeNotifier {
  List<RekomendasiModel> _rekomendasis = [];
  List<RekomendasiModel> get rekomendasis => _rekomendasis;
  set budidayas(List<RekomendasiModel> rekomendasis) {
    _rekomendasis = rekomendasis;
    notifyListeners();
  }

  Future<void> getRekomendasis() async {
    try {
      List<RekomendasiModel> rekomendasis =
          await RekomendasiService().getRekomendasi();
      _rekomendasis = rekomendasis;
    } catch (e) {
      print(e);
    }
  }
}
