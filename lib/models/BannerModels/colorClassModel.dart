class ColorClassModel {
  String? code;
  String? name;

  ColorClassModel({this.code, this.name});

  factory ColorClassModel.fromJson(Map<String, dynamic> json) {
    return ColorClassModel(name: json['name'], code: json['code']);
  }
}
