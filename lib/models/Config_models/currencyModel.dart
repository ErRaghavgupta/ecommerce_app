class CurrencyModel {
  String? code;
  String? created_at;
  num? exchange_rate;
  num? id;
  String? name;
  num? status;
  String? symbol;
  String? updated_at;

  CurrencyModel(
      {this.code,
      this.created_at,
      this.exchange_rate,
      this.name,
      this.updated_at,
      this.id,
      this.status,
      this.symbol});

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      name: json['name'],
      code: json['code'],
      id: json['id'],
      exchange_rate: json['exchange_rate'],
      status: json['status'],
      symbol: json['symbol'],
      updated_at: json['updated_at'],
      created_at: json['created_at'],
    );
  }
}
