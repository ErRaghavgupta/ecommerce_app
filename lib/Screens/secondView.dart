import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app/Api%20folder/api_helper.dart';
import 'package:ecommerce_app/LocalStorage/sharedPreference.dart';
import 'package:ecommerce_app/Urls/urls.dart';
import 'package:ecommerce_app/models/Products/MainModel.dart';
import 'package:flutter/material.dart';
import '../Routes/routes.dart';

class SecondView extends StatefulWidget {
  int? getIndex;

  SecondView({super.key, this.getIndex});

  @override
  State<SecondView> createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
  int currentIndex = 0;
  int count = 1;
    MainProductModel? myModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: FutureBuilder(
        future: ApiHelper().getProductData(),
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
             myModel = snapshot.data!;
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              shrinkWrap: true,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        radius: 20,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_outlined,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                CarouselSlider.builder(
                  itemCount: snapshot.data!.products!.length,
                  itemBuilder: (context, index, realIndex) {
                    var images = snapshot.data!.products![widget.getIndex!].images!;
                    // print("url : ${Url.product_image_url}/${images.length}");

                    return ListView(
                      children: [
                        CarouselSlider.builder(
                          itemCount: images.length,
                          itemBuilder: (context, subIndex, realSubIndex) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                "${Url.product_image_url}/${images[subIndex]}",
                                width: MediaQuery.of(context).size.width * 0.7,
                                height:
                                    MediaQuery.of(context).size.height * 0.9,
                                fit: BoxFit.fill,
                              ),
                            );
                          },
                          options: CarouselOptions(
                            onPageChanged: (subIndex, reason) {},
                            viewportFraction: 1,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            autoPlayAnimationDuration: Duration(seconds: 2),
                            autoPlay: true,
                            enlargeFactor: 2,
                            enlargeCenterPage: true,
                          ),
                        ),
                      ],
                    );
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
                SizedBox(
                  height: 8,
                ),
                DotsIndicator(
                  dotsCount: snapshot.data!.products!.length,
                  decorator: DotsDecorator(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: Colors.grey,
                    activeColor: Colors.red,
                  ),
                  position: currentIndex,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  snapshot.data!.products![widget.getIndex!].name!,
                  textScaleFactor: 1.5,
                  // overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${snapshot.data!.products![widget.getIndex!].purchasePrice!}",
                      textScaleFactor: 1.5,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Seller : Tariqul islam",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Color",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(50)),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(snapshot.data!.products![widget.getIndex!].metaDescription!),
              ],
            );
          }
          return Container();
        },
      ),
      bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(50)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    border: Border.all(
                      color: Colors.white,
                      // width: 4
                    )),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          if (count > 0) {
                            count--;
                          }
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.remove,
                          color: Colors.white,
                        )),
                    Text(
                      count.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    IconButton(
                        onPressed: () {
                          count++;
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffff660e),
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
                  onPressed: () async {
                    // print("url id = ${Url.id}");

                    var prefs = await Shared().getPrefs();
                    print('id ${prefs.getString(Shared.tokenId)!}');

                    setState(() {
                      ApiHelper().addToCartApi({
                        "id": myModel!.products![widget.getIndex!].id.toString(),
                        "quantity": count.toString(),
                      }, prefs.getString(Shared.tokenId)!).then((value) {
                        Navigator.pushNamed(context, CART_ROUTE);
                      });
                    });
                  },
                  child: Text(
                    "Add to Cart",
                    // textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          )),
    ));
  }
}
