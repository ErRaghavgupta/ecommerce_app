class AddTOCartModel {
  String? id;
  String? quantity;

  AddTOCartModel({this.id, this.quantity});

  factory AddTOCartModel.fromJson(Map<String, dynamic> map) {
    return AddTOCartModel(id: map['id'], quantity: map['quantity']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "quantity": quantity,
    };
  }
}
