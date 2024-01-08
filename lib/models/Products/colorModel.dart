class ColorsClassModel {
  String? code;
  String? name;

  ColorsClassModel({this.code, this.name});

  factory ColorsClassModel.fromJson(Map<String, dynamic> json) {
    return ColorsClassModel(name: json['name'], code: json['code']);
  }
}
