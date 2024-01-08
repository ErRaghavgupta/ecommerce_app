class ChoiceOptionsModel {
  String? name;
  String? title;
  List<dynamic>? options;

  ChoiceOptionsModel({this.name, this.title, this.options});

  factory ChoiceOptionsModel.fromJson(Map<String, dynamic> json) {
    return ChoiceOptionsModel(
        name: json['name'], options: json['options'], title: json['title']);
  }
}
