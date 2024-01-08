class StaticUrlModel {
  String? brands;
  String? categories;
  String? contact_us;
  String? customer_account;

  StaticUrlModel(
      {this.brands, this.categories, this.contact_us, this.customer_account});

  factory StaticUrlModel.fromJson(Map<String, dynamic> json) {
    return StaticUrlModel(
        brands: json['brands'],
        categories: json['categories'],
        contact_us: json['contact_us'],
        customer_account: json['customer_account']);
  }
}
