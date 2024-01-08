import 'dart:convert';

import 'package:ecommerce_app/models/Products/products.dart';

// class MainModel {
//   num? limit;
//   num? offset;
//   num? total_size;
//   List<Products>? products;
//
//   MainModel({this.limit, this.offset, this.total_size, this.products});
//
//   factory MainModel.fromJson(Map<String, dynamic> map) {
//     List<Products> ProductList = [];
//     for (Map<String, dynamic> mapData in map['products']) {
//       ProductList.add(Products.fromJson(mapData));
//     }
//
//     return MainModel(
//         offset: map['offset'],
//         limit: map['limit'],
//         total_size: map['total_size'],
//         products: ProductList);
//   }
// }
// To parse this JSON data, do
//
//     final mainProductModel = mainProductModelFromJson(jsonString);

import 'dart:convert';

MainProductModel mainProductModelFromJson(String str) =>
    MainProductModel.fromJson(json.decode(str));

String mainProductModelToJson(MainProductModel data) =>
    json.encode(data.toJson());

class MainProductModel {
  num? totalSize;
  num? limit;
  num? offset;
  List<Product>? products;

  MainProductModel({
    this.totalSize,
    this.limit,
    this.offset,
    this.products,
  });

  factory MainProductModel.fromJson(Map<String, dynamic> json) =>
      MainProductModel(
        totalSize: json["total_size"],
        limit: json["limit"],
        offset: json["offset"],
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_size": totalSize,
        "limit": limit,
        "offset": offset,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  num? id;
  String? addedBy;
  num? userId;
  String? name;
  String? slug;
  String? productType;
  List<CategoryId>? categoryIds;
  num? brandId;
  String? unit;
  num? minQty;
  num? refundable;
  dynamic digitalProductType;
  dynamic digitalFileReady;
  List<String>? images;
  String? thumbnail;
  num? featured;
  dynamic flashDeal;
  String? videoProvider;
  dynamic videoUrl;
  List<MColor>? colors;
  num? variantProduct;
  List<int>? attributes;
  List<ChoiceOption>? choiceOptions;
  List<Variation>? variation;
  num? published;
  num? unitPrice;
  num? purchasePrice;
  num? tax;
  String? taxType;
  double? discount;
  String? discountType;
  num? currentStock;
  num? minimumOrderQty;
  String? details;
  num? freeShipping;
  dynamic attachment;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? status;
  num? featuredStatus;
  String? metaTitle;
  String? metaDescription;
  String? metaImage;
  num? requestStatus;
  dynamic deniedNote;
  num? shippingCost;
  num? multiplyQty;
  dynamic tempShippingCost;
  dynamic isShippingCostUpdated;
  String? code;
  num? reviewsCount;
  List<Rating>? rating;
  List<dynamic>? translations;
  List<Review>? reviews;

  Product({
    this.id,
    this.addedBy,
    this.userId,
    this.name,
    this.slug,
    this.productType,
    this.categoryIds,
    this.brandId,
    this.unit,
    this.minQty,
    this.refundable,
    this.digitalProductType,
    this.digitalFileReady,
    this.images,
    this.thumbnail,
    this.featured,
    this.flashDeal,
    this.videoProvider,
    this.videoUrl,
    this.colors,
    this.variantProduct,
    this.attributes,
    this.choiceOptions,
    this.variation,
    this.published,
    this.unitPrice,
    this.purchasePrice,
    this.tax,
    this.taxType,
    this.discount,
    this.discountType,
    this.currentStock,
    this.minimumOrderQty,
    this.details,
    this.freeShipping,
    this.attachment,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.featuredStatus,
    this.metaTitle,
    this.metaDescription,
    this.metaImage,
    this.requestStatus,
    this.deniedNote,
    this.shippingCost,
    this.multiplyQty,
    this.tempShippingCost,
    this.isShippingCostUpdated,
    this.code,
    this.reviewsCount,
    this.rating,
    this.translations,
    this.reviews,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        addedBy: json["added_by"],
        userId: json["user_id"],
        name: json["name"],
        slug: json["slug"],
        productType: json["product_type"],
        categoryIds: json["category_ids"] == null
            ? []
            : List<CategoryId>.from(
                json["category_ids"]!.map((x) => CategoryId.fromJson(x))),
        brandId: json["brand_id"],
        unit: json["unit"],
        minQty: json["min_qty"],
        refundable: json["refundable"],
        digitalProductType: json["digital_product_type"],
        digitalFileReady: json["digital_file_ready"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        thumbnail: json["thumbnail"],
        featured: json["featured"],
        flashDeal: json["flash_deal"],
        videoProvider: json["video_provider"],
        videoUrl: json["video_url"],
        colors: json["colors"] == null
            ? []
            : List<MColor>.from(json["colors"]!.map((x) => MColor.fromJson(x))),
        variantProduct: json["variant_product"],
        attributes: json["attributes"] == null
            ? []
            : List<int>.from(json["attributes"]!.map((x) => x)),
        choiceOptions: json["choice_options"] == null
            ? []
            : List<ChoiceOption>.from(
                json["choice_options"]!.map((x) => ChoiceOption.fromJson(x))),
        variation: json["variation"] == null
            ? []
            : List<Variation>.from(
                json["variation"]!.map((x) => Variation.fromJson(x))),
        published: json["published"],
        unitPrice: json["unit_price"],
        purchasePrice: json["purchase_price"],
        tax: json["tax"],
        taxType: json["tax_type"],
        discount: json["discount"]?.toDouble(),
        discountType: json["discount_type"],
        currentStock: json["current_stock"],
        minimumOrderQty: json["minimum_order_qty"],
        details: json["details"],
        freeShipping: json["free_shipping"],
        attachment: json["attachment"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        status: json["status"],
        featuredStatus: json["featured_status"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaImage: json["meta_image"],
        requestStatus: json["request_status"],
        deniedNote: json["denied_note"],
        shippingCost: json["shipping_cost"],
        multiplyQty: json["multiply_qty"],
        tempShippingCost: json["temp_shipping_cost"],
        isShippingCostUpdated: json["is_shipping_cost_updated"],
        code: json["code"],
        reviewsCount: json["reviews_count"],
        rating: json["rating"] == null
            ? []
            : List<Rating>.from(json["rating"]!.map((x) => Rating.fromJson(x))),
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(
                json["reviews"]!.map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "added_by": addedBy,
        "user_id": userId,
        "name": name,
        "slug": slug,
        "product_type": productType,
        "category_ids": categoryIds == null
            ? []
            : List<dynamic>.from(categoryIds!.map((x) => x.toJson())),
        "brand_id": brandId,
        "unit": unit,
        "min_qty": minQty,
        "refundable": refundable,
        "digital_product_type": digitalProductType,
        "digital_file_ready": digitalFileReady,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "thumbnail": thumbnail,
        "featured": featured,
        "flash_deal": flashDeal,
        "video_provider": videoProvider,
        "video_url": videoUrl,
        "colors": colors == null
            ? []
            : List<dynamic>.from(colors!.map((x) => x.toJson())),
        "variant_product": variantProduct,
        "attributes": attributes == null
            ? []
            : List<dynamic>.from(attributes!.map((x) => x)),
        "choice_options": choiceOptions == null
            ? []
            : List<dynamic>.from(choiceOptions!.map((x) => x.toJson())),
        "variation": variation == null
            ? []
            : List<dynamic>.from(variation!.map((x) => x.toJson())),
        "published": published,
        "unit_price": unitPrice,
        "purchase_price": purchasePrice,
        "tax": tax,
        "tax_type": taxType,
        "discount": discount,
        "discount_type": discountType,
        "current_stock": currentStock,
        "minimum_order_qty": minimumOrderQty,
        "details": details,
        "free_shipping": freeShipping,
        "attachment": attachment,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "status": status,
        "featured_status": featuredStatus,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_image": metaImage,
        "request_status": requestStatus,
        "denied_note": deniedNote,
        "shipping_cost": shippingCost,
        "multiply_qty": multiplyQty,
        "temp_shipping_cost": tempShippingCost,
        "is_shipping_cost_updated": isShippingCostUpdated,
        "code": code,
        "reviews_count": reviewsCount,
        "rating": rating == null
            ? []
            : List<dynamic>.from(rating!.map((x) => x.toJson())),
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
        "reviews": reviews == null
            ? []
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
      };
}

class CategoryId {
  String? id;
  num? position;

  CategoryId({
    this.id,
    this.position,
  });

  factory CategoryId.fromJson(Map<String, dynamic> json) => CategoryId(
        id: json["id"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "position": position,
      };
}

class ChoiceOption {
  String? name;
  String? title;
  List<String>? options;

  ChoiceOption({
    this.name,
    this.title,
    this.options,
  });

  factory ChoiceOption.fromJson(Map<String, dynamic> json) => ChoiceOption(
        name: json["name"],
        title: json["title"],
        options: json["options"] == null
            ? []
            : List<String>.from(json["options"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "title": title,
        "options":
            options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
      };
}

class MColor {
  String? name;
  String? code;

  MColor({
    this.name,
    this.code,
  });

  factory MColor.fromJson(Map<String, dynamic> json) => MColor(
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
      };
}

class Rating {
  String? average;
  num? productId;

  Rating({
    this.average,
    this.productId,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"],
        productId: json["product_id"],
      );

  Map<String, dynamic> toJson() => {
        "average": average,
        "product_id": productId,
      };
}

class Review {
  num? id;
  num? productId;
  num? customerId;
  String? comment;
  String? attachment;
  num? rating;
  num? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Review({
    this.id,
    this.productId,
    this.customerId,
    this.comment,
    this.attachment,
    this.rating,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        productId: json["product_id"],
        customerId: json["customer_id"],
        comment: json["comment"],
        attachment: json["attachment"],
        rating: json["rating"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "customer_id": customerId,
        "comment": comment,
        "attachment": attachment,
        "rating": rating,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Variation {
  String? type;
  num? price;
  String? sku;
  num? qty;

  Variation({
    this.type,
    this.price,
    this.sku,
    this.qty,
  });

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
        type: json["type"],
        price: json["price"],
        sku: json["sku"],
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "price": price,
        "sku": sku,
        "qty": qty,
      };
}
