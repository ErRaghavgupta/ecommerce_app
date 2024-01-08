import 'dart:convert';
import 'package:ecommerce_app/Api%20folder/api_helper.dart';
import 'package:ecommerce_app/models/Config_models/ConfigMainModel.dart';
import 'package:ecommerce_app/models/Products/MainModel.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_app/Urls/urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

// import 'package:ecommerce_app/Bloc/ecommerce_bloc.dart';
import 'package:ecommerce_app/Widgets/Textfield.dart';
import '../Routes/routes.dart';

class FirstView extends StatefulWidget {
  const FirstView({Key? key}) : super(key: key);

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  var controller = TextEditingController();
  int currentIndex = 0;
  ConfigMainModel? configMainModel;

  @override
  void initState() {
    super.initState();
    getConfigApi();
  }

  Future<ConfigMainModel> getConfigApi() async {
    var i = await ApiHelper.getApi(url: Url.CONFIG_URl);
    configMainModel = ConfigMainModel.fromJson(i);
    Url.banner_image_url = configMainModel!.baseUrls!.bannerImageUrl!;
    Url.product_thumbnail_url = configMainModel!.baseUrls!.productThumbnailUrl!;
    Url.category_image_url = configMainModel!.baseUrls!.categoryImageUrl!;
     Url.product_image_url = configMainModel!.baseUrls!.productImageUrl!;
    // Urls.customerImageUrl = baseUrl.categoryImageUrl!;
    // Urls.categoryImageUrl = baseUrl.categoryImageUrl!;
    // Urls.reviewImageUrl = baseUrl.reviewImageUrl!;
    // Urls.sellerImageUrl = baseUrl.sellerImageUrl!;
    // Urls.shopImageUrl = baseUrl.shopImageUrl!;
    // Urls.bannerImageUrl = baseUrl.bannerImageUrl!;
    // Urls.notificationImageUrl = baseUrl.notificationImageUrl!;
    print(" this model ${Url.banner_image_url}");
    print("urls data = ${Url.product_image_url}");
    return configMainModel!;
  }

  List<Map<String, dynamic>> colorsList = [
    {
      "color": Colors.red,
    },
    {
      "color": Colors.orange,
    },
    {
      "color": Colors.amberAccent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(child: Icon(Icons.notifications_none_sharp)),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Textfield(
              prefixIcon: Icon(Icons.search),
              labelText: "Search...",
              hintText: "Search..",
              controller: controller,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              focusNode: FocusNode(),
              onSaved: (p0) {
                // setState(() {
                //
                // });
              },
              validator: (p0) {},
            ),
            SizedBox(
              height: 15,
            ),
            FutureBuilder(
              future: ApiHelper().getBannerData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  print("${Url.banner_image_url}/${snapshot.data}");
                  return Center(
                    child: Text("Error : ${snapshot.hasError}"),
                  );
                } else if (snapshot.hasData) {
                  return Column(
                    children: [
                      CarouselSlider.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index, realIndex) {
                          return ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                "${Url.banner_image_url}/${snapshot.data![index].photo}",
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.9,
                                fit: BoxFit.cover,
                              ));
                        },
                        options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            currentIndex = index;
                            setState(() {});
                          },
                          viewportFraction: 1,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          autoPlayAnimationDuration: Duration(seconds: 2),
                          autoPlay: true,
                          enlargeFactor: 2,
                          enlargeCenterPage: true,
                        ),
                      ),
                      DotsIndicator(
                        dotsCount: snapshot.data!.length,
                        // dotsCount: s,
                        // dotsCount: state.bannerModel?.length ?? 2,
                        decorator: DotsDecorator(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          color: Colors.grey,
                          activeColor: Colors.red,
                        ),
                        position: currentIndex,
                      ),
                    ],
                  );
                }
                return Container();
              },
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 100,
              width: 200,
              child: FutureBuilder(
                future: ApiHelper().categoryListItems(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error : ${snapshot.hasError}"),
                    );
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: NetworkImage(
                                  "${Url.category_image_url}/${snapshot.data![index].icon!}",
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  snapshot.data![index].name!,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Special for you",
                  textScaleFactor: 1.3,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "See all",
                  textScaleFactor: 1.3,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            FutureBuilder(
              future: ApiHelper().getProductData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error2 = ${snapshot.hasError}"),
                  );
                } else if (snapshot.hasData) {
                  return GridView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.products!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 240,
                        mainAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, SECOND_ROUTE,arguments: index);
                          },
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    height: 40,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(25),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                      color: Colors.deepOrange,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    "${Url.product_thumbnail_url}/${snapshot.data!.products![index].thumbnail!}",
                                    height: MediaQuery.of(context).size.height *
                                        0.18,
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Expanded(
                                      child: Text(
                                        snapshot.data!.products![index].name!,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$${snapshot.data!.products![index].purchasePrice!}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          ...colorsList.map((e) {
                                            return Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 2),
                                              child: CircleAvatar(
                                                  radius: 8,
                                                  backgroundColor: e['color']),
                                            );
                                          }),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
