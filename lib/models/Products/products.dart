import 'package:ecommerce_app/models/BannerModels/categoryIDModel.dart';
import 'package:ecommerce_app/models/BannerModels/variationModel.dart';
import 'package:ecommerce_app/models/Products/colorModel.dart';
import 'package:ecommerce_app/models/Products/variation.dart';

import 'category.dart';
import 'choiceOption.dart';

class Products {
  num? id;
  String? addedBy;
  num? userId;
  String? name;
  String? slug;
  String? productType;
  List<CategoryIdsModel>? categoryIds;
  num? brandId;
  String? unit;
  num? minQty;
  num? refundable;
  String? digitalProductType;
  String? digitalFileReady;
  List<dynamic>? images;
  String? thumbnail;
  num? featured;
  String? flashDeal;
  String? videoProvider;
  String? videoUrl;
  List<ColorsClassModel>? colors;
  num? variantProduct;
  List<dynamic>? attributes;
  List<ChoiceOptionModel>? choiceOptions;
  List<VariationModels>? variation;
  num? published;
  num? unitPrice;
  double? purchasePrice;
  num? tax;
  String? taxType;
  num? discount;
  String? discountType;
  num? currentStock;
  num? minimumOrderQty;
  String? details;
  num? freeShipping;
  String? attachment;
  String? createdAt;
  String? updatedAt;
  num? status;
  num? featuredStatus;
  String? metaTitle;
  String? metaDescription;
  String? metaImage;
  num? requestStatus;
  String? deniedNote;
  num? shippingCost;
  num? multiplyQty;
  String? tempShippingCost;
  String? isShippingCostUpdated;
  String? code;
  num? reviewsCount;

  Products({
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
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    List<CategoryIdsModel> catIdModel = [];
    for (Map<String, dynamic> mapList in json['categoryIds']) {
      catIdModel.add(CategoryIdsModel.fromJson(mapList));
    }

    List<ChoiceOptionModel> choiceModel = [];
    for (Map<String, dynamic> listData in json['choiceOptions']) {
      choiceModel.add(ChoiceOptionModel.fromJson(listData));
    }
    List<VariationModels> variety = [];
    for (Map<String, dynamic> mapData in json['variation']) {
      variety.add(VariationModels.fromJson(mapData));
    }

    List<ColorsClassModel> model = [];
    for (Map<String, dynamic> mapFig in json['colors']) {
      model.add(ColorsClassModel.fromJson(mapFig));
    }

    return Products(
        categoryIds: catIdModel,
        choiceOptions: choiceModel,
        colors: model,
        images: json["images"],
        variation: variety,
        thumbnail: json['thumbnail'],
        tax: json['tax'],
        slug: json['slug'],
        refundable: json['refundable'],
        published: json['published'],
        featured: json['featured'],
        details: json['details'],
        status: json['status'],
        attributes: json['attributes'],
        attachment: json['attachment'],
        name: json['name'],
        code: json['code'],
        id: json['id'],
        unit: json['unit'],
        userId: json['userId'],
        addedBy: json['addedBy'],
        brandId: json['brandId'],
        createdAt: json['createdAt'],
        currentStock: json['currentStock'],
        deniedNote: json['deniedNote'],
        digitalFileReady: json['digitalFileReady'],
        digitalProductType: json['digitalProductType'],
        discount: json['discount'],
        discountType: json['discountType'],
        featuredStatus: json['featuredStatus'],
        flashDeal: json['flashDeal'],
        freeShipping: json['freeShipping'],
        isShippingCostUpdated: json['isShippingCostUpdated'],
        metaDescription: json['metaDescription'],
        metaImage: json['metaImage'],
        metaTitle: json['metaTitle'],
        minimumOrderQty: json['minimumOrderQty'],
        minQty: json['minQty'],
        productType: json['productType'],
        multiplyQty: json['multiplyQty'],
        purchasePrice: json['purchasePrice'],
        reviewsCount: json['reviewsCount'],
        shippingCost: json['shippingCost'],
        requestStatus: json['requestStatus'],
        tempShippingCost: json['tempShippingCost'],
        videoUrl: json['videoUrl'],
        videoProvider: json['videoProvider'],
        variantProduct: json['variantProduct'],
        updatedAt: json['updatedAt'],
        unitPrice: json['unitPrice'],
        taxType: json['taxType']);
  }
}
