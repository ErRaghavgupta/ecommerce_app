class VariationModel {
  num? price;
  num? qty;
  String? sku;
  String? type;

  VariationModel({this.price, this.qty, this.sku, this.type});

  factory VariationModel.fromJson(Map<String, dynamic> json) {
    return VariationModel(
        price: json['price'],
        qty: json['qty'],
        sku: json['sku'],
        type: json['type']);
  }
}
