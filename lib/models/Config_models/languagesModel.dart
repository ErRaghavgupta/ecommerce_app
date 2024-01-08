class LanguagesModel {
  String? code;
  String? name;

  LanguagesModel({this.code, this.name});

  factory LanguagesModel.fromJson(Map<String, dynamic> json) {
    return LanguagesModel(code: json['code'], name: json['name']);
  }
}
