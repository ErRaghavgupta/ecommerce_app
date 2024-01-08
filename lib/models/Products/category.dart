class CategoryIdsModel {
  String? id;
  num? position;

  CategoryIdsModel({this.id, this.position});

  factory CategoryIdsModel.fromJson(Map<String, dynamic> json) {
    return CategoryIdsModel(id: json['id'], position: json['position']);
  }
}
