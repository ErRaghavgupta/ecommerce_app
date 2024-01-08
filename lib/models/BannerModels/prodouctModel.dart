
import 'package:ecommerce_app/models/BannerModels/categoryIDModel.dart';
import 'package:ecommerce_app/models/BannerModels/colorClassModel.dart';
import 'package:ecommerce_app/models/BannerModels/reviewModels.dart';
import 'package:ecommerce_app/models/BannerModels/variationModel.dart';

import 'choiceOptionsModel.dart';

class ProductModel {
  String? added_by;
  String? attachment;
  List<dynamic>? attributes;
  int? brand_id;
  List<CategoryIdModel>? category_ids;
  List<ChoiceOptionsModel>? choice_options;
  String? code;
  List<ColorClassModel>? colors;
  String? created_at;
  String? denied_note;
  String? details;
  String? digital_file_ready;
  String? digital_product_type;
  num? discount;
  num? current_stock;
  String? discount_type;
  num? featured;
  num? featured_status;
  num? free_shipping;
  num? id;
  String? flash_deal;
  List<dynamic>? images;
  String? is_shipping_cost_updated;
  String? meta_description;
  String? meta_image;
  String? meta_title;
  num? minimum_order_qty;
  num? min_qty;
  num? multiply_qty;
  String? name;
  String? product_type;
  String? slug;
  num? published;
  num? purchase_price;
  num? refundable;
  num? request_status;
  num? reviews_count;
  num? shipping_cost;
  List<ReviewModel>? reviews;
  num? status;
  num? tax;
  String? tax_type;
  String? temp_shipping_cost;
  String? thumbnail;
  String? unit;
  num? unit_price;
  String? updated_at;
  num? user_id;
  num? variant_product;
  String? video_provider;
  String? video_url;
  List<VariationModel>? variation;

  ProductModel(
      {this.added_by,
      this.attachment,
      this.attributes,
      this.brand_id,
      this.category_ids,
      this.choice_options,
      this.code,
      this.colors,
      this.created_at,
      this.denied_note,
      this.details,
      this.digital_file_ready,
      this.digital_product_type,
      this.discount,
      this.current_stock,
      this.discount_type,
      this.featured,
      this.featured_status,
      this.free_shipping,
      this.id,
      this.flash_deal,
      this.images,
      this.is_shipping_cost_updated,
      this.meta_description,
      this.meta_image,
      this.meta_title,
      this.minimum_order_qty,
      this.min_qty,
      this.multiply_qty,
      this.name,
      this.product_type,
      this.slug,
      this.published,
      this.purchase_price,
      this.refundable,
      this.request_status,
      this.reviews_count,
      this.shipping_cost,
      this.reviews,
      this.status,
      this.tax,
      this.tax_type,
      this.temp_shipping_cost,
      this.thumbnail,
      this.unit,
      this.unit_price,
      this.updated_at,
      this.user_id,
      this.variant_product,
      this.video_provider,
      this.video_url,
      this.variation});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<CategoryIdModel> mCategory = [];
    for (Map<String, dynamic> eachCategory in json['category_ids']) {
      mCategory.add(CategoryIdModel.fromJson(eachCategory));
    }
    List<ChoiceOptionsModel> OptionModel = [];
    for (Map<String, dynamic> eachOptions in json['choice_options']) {
      OptionModel.add(ChoiceOptionsModel.fromJson(eachOptions));
    }
    List<ColorClassModel> colorClassModelList = [];
    for (Map<String, dynamic> eachModel in json['colors']) {
      colorClassModelList.add(ColorClassModel.fromJson(eachModel));
    }
    List<ReviewModel> ReveiewModelList = [];
    for (Map<String, dynamic> eachReviewModel in json['reviews']) {
      ReveiewModelList.add(ReviewModel.fromJson(eachReviewModel));
    }
    List<VariationModel> variationList = [];
    for (Map<String, dynamic> eachVariation in json['variation']) {
      variationList.add(VariationModel.fromJson(eachVariation));
    }
    return ProductModel(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      attachment: json['attachment'],
      created_at: json['created_at'],
      status: json['status'],
      unit: json['unit'],
      updated_at: json['updated_at'],
      added_by: json['added_by'],
      attributes: json['attributes'],
      brand_id: json['brand_id'],
      current_stock: json['current_stock'],
      denied_note: json['denied_note'],
      details: json['details'],
      digital_file_ready: json['digital_file_ready'],
      digital_product_type: json['digital_product_type'],
      discount: json['discount'],
      discount_type: json['discount_type'],
      featured: json['featured'],
      featured_status: json['featured_status'],
      flash_deal: json['flash_deal'],
      free_shipping: json['free_shipping'],
      images: json['images'],
      is_shipping_cost_updated: json['is_shipping_cost_updated'],
      meta_description: json['meta_description'],
      meta_image: json['meta_image'],
      meta_title: json['meta_title'],
      min_qty: json['min_qty'],
      minimum_order_qty: json['minimum_order_qty'],
      multiply_qty: json['multiply_qty'],
      product_type: json['product_type'],
      published: json['published'],
      purchase_price: json['purchase_price'],
      refundable: json['refundable'],
      request_status: json['request_status'],
      reviews_count: json['reviews_count'],
      shipping_cost: json['shipping_cost'],
      slug: json['slug'],
      tax: json['tax'],
      tax_type: json['tax_type'],
      temp_shipping_cost: json['temp_shipping_cost'],
      thumbnail: json['thumbnail'],
      unit_price: json['unit_price'],
      variant_product: json['variant_product'],
      user_id: json['user_id'],
      video_provider: json['video_provider'],
      video_url: json['video_url'],
      category_ids: mCategory,
      choice_options: OptionModel,
      colors: colorClassModelList,
      reviews: ReveiewModelList,
      variation: variationList,
    );
  }
}
