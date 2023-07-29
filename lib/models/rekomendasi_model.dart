class RekomendasiModel {
  int? id;
  String? title;
  String? full_text;
  String? url_image;

  RekomendasiModel({this.id, this.title, this.full_text, this.url_image});

  RekomendasiModel.fromJson(Map<String, dynamic> json) {
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
