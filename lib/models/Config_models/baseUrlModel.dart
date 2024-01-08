class BaseUrlModel {
  String? banner_image_url;
  String? brand_image_url;
  String? category_image_url;
  String? customer_image_url;
  String? digital_product_url;
  String? notification_image_url;
  String? product_image_url;
  String? product_thumbnail_url;
  String? review_image_url;
  String? seller_image_url;
  String? shop_image_url;

  BaseUrlModel(
      {this.banner_image_url,
      this.brand_image_url,
      this.category_image_url,
      this.customer_image_url,
      this.digital_product_url,
      this.notification_image_url,
      this.product_image_url,
      this.product_thumbnail_url,
      this.review_image_url,
      this.seller_image_url,
      this.shop_image_url});

  factory BaseUrlModel.fromJson(Map<String, dynamic> json) {
    return BaseUrlModel(
        banner_image_url: json['banner_image_url'],
        brand_image_url: json['brand_image_url'],
        category_image_url: json['category_image_url'],
        customer_image_url: json['customer_image_url'],
        digital_product_url: json['digital_product_url'],
        notification_image_url: json['notification_image_url'],
        product_image_url: json['product_image_url'],
        product_thumbnail_url: json['product_thumbnail_url'],
        review_image_url: json['review_image_url'],
        seller_image_url: json['seller_image_url'],
        shop_image_url: json['shop_image_url']);
  }
}
