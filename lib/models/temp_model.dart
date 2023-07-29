class TempModel {
  late double day;

  TempModel({
    required this.day,
  });

  TempModel.fromJson(Map<String, dynamic> json) {
    day = double.parse(json['day'].toString());
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
    };
  }
}
