class ChoiceOptionModel {
  String? name;
  String? title;
  List<dynamic>? options;

  ChoiceOptionModel({this.name, this.title, this.options});

  factory ChoiceOptionModel.fromJson(Map<String, dynamic> json) {
    return ChoiceOptionModel(
        name: json['name'], options: json['options'], title: json['title']);
  }
}
