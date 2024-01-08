class Url {
  static const String BASE_URL = 'https://www.infusevalue.live/api/v1/';
  static const String CONFIG_URl = '${BASE_URL}config';
  static const String BANNER_URl = '${BASE_URL}banners?banner_type=main_banner';
  static const String PRODUCT_URl =
      '${BASE_URL}products/latest?limit=10&offset=2';
  static const String CATEGORY_URL = "${BASE_URL}categories";
  static const String REGISTER_URL = "${BASE_URL}auth/register";

// https://www.infusevalue.live/api/v1/products/latest?limit=10&offset=2

  static String banner_image_url = '';
  static String brand_image_url = '';
  static String category_image_url = '';
  static String customer_image_url = '';
  static String digital_product_url = '';
  static String notification_image_url = '';
  static String product_image_url = '';
  static String product_thumbnail_url = '';
  static String review_image_url = '';
  static String seller_image_url = '';
  static String shop_image_url = '';
}
