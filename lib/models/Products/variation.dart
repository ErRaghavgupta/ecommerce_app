class VariationModels {
  num? price;
  num? qty;
  String? sku;
  String? type;

  VariationModels({this.price, this.qty, this.sku, this.type});

  factory VariationModels.fromJson(Map<String, dynamic> json) {
    return VariationModels(
        price: json['price'],
        qty: json['qty'],
        sku: json['sku'],
        type: json['type']);
  }
}