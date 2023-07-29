class WeatherModel {
  late int id;
  late String main;
  late String description;
  late String icon;

  WeatherModel(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'main': main, 'description': description, 'icon': icon};
  }
}
