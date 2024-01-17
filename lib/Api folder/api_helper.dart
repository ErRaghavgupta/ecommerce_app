import 'dart:convert';
import 'dart:io';
import 'package:ecommerce_app/Urls/urls.dart';
import 'package:ecommerce_app/models/BannerModels/BannerModel.dart';
import 'package:ecommerce_app/models/CategoryModelFolder/CategoryMainModel.dart';
import 'package:ecommerce_app/models/Products/MainModel.dart';
import 'package:ecommerce_app/models/UserModel/RegisterErrorModel.dart';
import 'package:ecommerce_app/models/UserModel/RegisterModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'my_Exception.dart';

class ApiHelper {
  static Future<dynamic> getApi(
      {required String url, Map<String, String>? mHeader}) async {
    try {
      var res = await http.get(Uri.parse(url), headers: mHeader);
      print("res = $res");
      return returnDataResponse(res);
    } on SocketException {
      throw FetchDataException(body: "Internet Error");
    }
  }

  Future<List<BannerModel>> getBannerData() async {
    var url = Url.BANNER_URl;
    var data;
    try {
      var response = await http.get(Uri.parse(url));
      List<BannerModel> bannerModel = [];
      var json = jsonDecode(response.body);
      for (Map<String, dynamic> mapData in json) {
        bannerModel.add(BannerModel.fromJson(mapData));
      }
      data = returnDataResponse(response);
      return bannerModel;
    } on SocketException {
      throw FetchDataException(body: "Internet Error");
    }
  }

  //10 api hai get url ki toh uske liye app 10 hi function create karoe

  // Future<dynamic> postApi(
  //     {required String url,
  //     Map<String, String>? mHeader,
  //     Map<String, String>? body}) async {
  //   //var mData;
  //
  //   try {
  //     var res = await http.post(Uri.parse(url),
  //         body: body,
  //         headers: mHeader ??
  //             {
  //               "Authorization":
  //                   "nXWH9BLpCYtVtyjDTbJB3Hf20uneSxZcYisVLVmNDV4PamGm6EeVDgZmm"
  //             });
  //
  //     return returnDataResponse(res);
  //   } on SocketException {
  //     throw FetchDataException(body: "Internet Error");
  //   }
  // }

  Future<MainProductModel> getProductData() async {
    var url = Url.PRODUCT_URl;
    var data;
    try {
      var response = await http.get(Uri.parse(url));
      var jsonData = jsonDecode(response.body);
      data = returnDataResponse(response);
      return MainProductModel.fromJson(jsonData);
    } on SocketException {
      throw FetchDataException(body: "Internet Error");
    }
  }

  Future<List<CategoryProductMainModel>> categoryListItems() async {
    var url = Url.CATEGORY_URL;
    var data;
    try {
      var response = await http.get(Uri.parse(url));
      var json = jsonDecode(response.body);
      List<CategoryProductMainModel> categoryModel = [];
      for (Map<String, dynamic> model in json) {
        categoryModel.add(CategoryProductMainModel.fromJson(model));
      }
      data = returnDataResponse(response);
      return categoryModel;
    } on SocketException {
      throw FetchDataException(body: "Internet Error");
    }
  }

  Future<dynamic> registerApi({
    Map<String, dynamic>? body,
    required Widget container,
  }) async {
    var url = Url.REGISTER_URL;
    try {
      var response = await http.post(
        Uri.parse(url),
        body: body,
      );
      print("response  = $response");
      var json = jsonDecode(response.body);
      // returnDataResponse(response);
      // var json2 = jsonDecode(response.body);
      // RegisterErrorModelClass.fromJson(json);
      if (response.statusCode == 200) {
        return RegisterModel.fromJson(json);
      } else {
        return RegisterErrorModelClass.fromJson(json);
        // return returnDataResponse(response);
      }
      // return RegisterModel.fromJson(json);
    } on SocketException {
      throw FetchDataException(body: "Internet Error");
    }
  }

  static dynamic returnDataResponse(http.Response res) {
    switch (res.statusCode) {
      case 200:
        var mData = res.body;
        print("status code : ${res.statusCode}");
        print("mData : $mData");
        return jsonDecode(mData);

      case 400:
        throw BadRequestException(body: res.body.toString());

      case 401:
      case 403:
        throw UserAlreadyRegister(body: res.body.toString());

      case 407:
        throw UnAuthorisedException(body: res.body.toString());

      case 500:
      default:
        throw FetchDataException(body: "Error while communicating to server");
    }
  }
}
