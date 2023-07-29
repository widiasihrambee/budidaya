class ArtikelModel {
  int? id;
  late String title;
  String? full_text;
  String? url_image;
  DateTime? createdAt;
  DateTime? updatedAt;

  ArtikelModel(
      {this.id,
      required this.title,
      this.full_text,
      this.url_image,
      this.createdAt,
      this.updatedAt});

  ArtikelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    full_text = json['full_text'];
    url_image = json['url_image'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'full_text': full_text,
      'url_image': url_image,
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString()
    };
  }
}
