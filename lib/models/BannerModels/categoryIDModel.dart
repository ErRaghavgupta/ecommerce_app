class CategoryIdModel {
  String? id;
  num? position;

  CategoryIdModel({this.id, this.position});

  factory CategoryIdModel.fromJson(Map<String, dynamic> json) {
    return CategoryIdModel(id: json['id'], position: json['position']);
  }
}
