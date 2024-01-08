class ReviewModel {
  String? attachment;
  String? comment;
  String? created_at;
  num? customer_id;
  num? id;
  num? product_id;
  num? rating;
  num? status;
  String? updated_at;

  ReviewModel(
      {this.attachment,
      this.status,
      this.id,
      this.updated_at,
      this.created_at,
      this.rating,
      this.comment,
      this.customer_id,
      this.product_id});

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
        status: json['status'],
        updated_at: json['updated_at'],
        created_at: json['created_at'],
        id: json['id'],
        rating: json['rating'],
        attachment: json['attachment'],
        comment: json['comment'],
        customer_id: json['customer_id'],
        product_id: json['product_id']);
  }
}
