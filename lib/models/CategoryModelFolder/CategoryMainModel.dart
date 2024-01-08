// To parse this JSON data, do
//
//     final categoryProductMainModel = categoryProductMainModelFromJson(jsonString);

import 'dart:convert';

List<CategoryProductMainModel> categoryProductMainModelFromJson(String str) => List<CategoryProductMainModel>.from(json.decode(str).map((x) => CategoryProductMainModel.fromJson(x)));

String categoryProductMainModelToJson(List<CategoryProductMainModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryProductMainModel {
  int? id;
  String? name;
  String? slug;
  String? icon;
  int? parentId;
  int? position;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? homeStatus;
  int? priority;
  List<CategoryProductMainModel>? childes;
  List<dynamic>? translations;

  CategoryProductMainModel({
    this.id,
    this.name,
    this.slug,
    this.icon,
    this.parentId,
    this.position,
    this.createdAt,
    this.updatedAt,
    this.homeStatus,
    this.priority,
    this.childes,
    this.translations,
  });

  factory CategoryProductMainModel.fromJson(Map<String, dynamic> json) => CategoryProductMainModel(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    icon: json["icon"],
    parentId: json["parent_id"],
    position: json["position"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    homeStatus: json["home_status"],
    priority: json["priority"],
    childes: json["childes"] == null ? [] : List<CategoryProductMainModel>.from(json["childes"]!.map((x) => CategoryProductMainModel.fromJson(x))),
    translations: json["translations"] == null ? [] : List<dynamic>.from(json["translations"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "icon": icon,
    "parent_id": parentId,
    "position": position,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "home_status": homeStatus,
    "priority": priority,
    "childes": childes == null ? [] : List<dynamic>.from(childes!.map((x) => x.toJson())),
    "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x)),
  };
}
