class BudidayaModel {
  int? id;
  String? title;
  late String full_text;
  String? url_image;

  BudidayaModel({this.id, this.title, required this.full_text, this.url_image});

  BudidayaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    full_text = json['full_text'];
    url_image = json['url_image'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'full_text': full_text,
      'url_image': url_image
    };
  }
}
