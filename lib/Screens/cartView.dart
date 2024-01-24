// import 'package:ecommerce_app/Api%20folder/api_helper.dart';
// import 'package:ecommerce_app/LocalStorage/sharedPreference.dart';
// import 'package:ecommerce_app/Urls/urls.dart';
// import 'package:ecommerce_app/Widgets/Textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class AddToCart extends StatefulWidget {
//   const AddToCart({super.key});
//
//   @override
//   State<AddToCart> createState() => _AddToCartState();
// }
//
// class _AddToCartState extends State<AddToCart> {
//   var totalController = TextEditingController();
//
//   Future<String?> tokenData() async {
//     var prefs = await Shared().getPrefs();
//     return prefs.getString(Shared.tokenId);
//     // setState(() {});
//     // return data;
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showModalBottomSheet(
//             context: context,
//             builder: (context) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Textfield(
//                       suffixIcon:
//                           TextButton(onPressed: () {}, child: Text("Apply")),
//                       labelText: "Enter Discount code",
//                       hintText: "Enter Discount code",
//                       controller: totalController,
//                       textInputAction: TextInputAction.done,
//                       keyboardType: TextInputType.number,
//                       focusNode: FocusNode(),
//                       onSaved: (p0) {},
//                       validator: (p0) {},
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [Text("subtotal"), Text("\$245.00")],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [Text("subtotal"), Text("\$245.00")],
//                     ),
//                     ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Color(0xffff660e)),
//                         child: Text(
//                           "Checkout",
//                           style: TextStyle(
//                               color: Colors.white, fontWeight: FontWeight.bold),
//                         ))
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//         child: Text("count"),
//       ),
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "My Cart",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: FutureBuilder(
//         future: ApiHelper().getCartListApi(tokenData().toString()),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.active) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             print("api :${ApiHelper().getCartListApi(tokenData().toString())}");
//             print("token = ${tokenData().toString()}");
//             return Center(
//               child: Text("Error : ${snapshot.hasError}"),
//             );
//           } else if (snapshot.hasData) {
//             // print
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 return SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.15,
//                   child: Card(
//                       child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Row(
//                         children: [
//                           SizedBox(
//                             width: 7,
//                           ),
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(5),
//                             child: Image.network(
//                               "${Url.product_thumbnail_url}/${snapshot.data![index].thumbnail!}",
//                               height: 90,
//                               width: 100,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 15,
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     "Woman Sweter",
//                                     style:
//                                         TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                   SizedBox(
//                                     width:
//                                         MediaQuery.of(context).size.width * 0.1,
//                                   ),
//                                   IconButton(
//                                       onPressed: () {},
//                                       icon: Icon(Icons.delete)),
//                                 ],
//                               ),
//                               Text(
//                                 "Woman fashion",
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               // SizedBox(
//                               //   height: 5,
//                               // ),
//                               Row(
//                                 children: [
//                                   Text(
//                                     "\$70.00",
//                                     style:
//                                         TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                   SizedBox(
//                                     width: MediaQuery.of(context).size.width *
//                                         0.18,
//                                   ),
//                                   Container(
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: 8, vertical: 2),
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(50),
//                                         border: Border.all()),
//                                     child: Row(
//                                       children: [
//                                         InkWell(
//                                           onTap: () {},
//                                           child: Icon(
//                                             Icons.remove,
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 5,
//                                         ),
//                                         Text(
//                                           "1",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black),
//                                         ),
//                                         SizedBox(
//                                           width: 5,
//                                         ),
//                                         InkWell(
//                                           onTap: () {},
//                                           child: Icon(
//                                             Icons.add,
//                                             color: Colors.black,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   )),
//                 );
//               },
//               shrinkWrap: true,
//               padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//             );
//           }
//           return Container();
//         },
//       ),
//     ));
//   }
// }
import 'package:ecommerce_app/Api%20folder/api_helper.dart';
import 'package:ecommerce_app/LocalStorage/sharedPreference.dart';
import 'package:ecommerce_app/Urls/urls.dart';
import 'package:ecommerce_app/Widgets/Textfield.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  var totalController = TextEditingController();

  Future<String?> tokenData() async {
    var prefs = await Shared().getPrefs();
    return prefs.getString(Shared.tokenId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Textfield(
                        suffixIcon:
                            TextButton(onPressed: () {}, child: Text("Apply")),
                        labelText: "Enter Discount code",
                        hintText: "Enter Discount code",
                        controller: totalController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        focusNode: FocusNode(),
                        onSaved: (p0) {},
                        validator: (p0) {},
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("subtotal"), Text("\$245.00")],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("subtotal"), Text("\$245.00")],
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffff660e)),
                          child: Text(
                            "Checkout",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                );
              },
            );
          },
          child: Text("count"),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "My Cart",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: FutureBuilder(
          future: tokenData(),
          builder: (context, tokenSnapshot) {
            if (tokenSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (tokenSnapshot.hasError) {
              return Center(
                child: Text("Error fetching token: ${tokenSnapshot.error}"),
              );
            } else {
              // Use the token in the API call
              return FutureBuilder(
                future:
                    ApiHelper().getCartListApi(tokenSnapshot.data.toString()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    print("Error loading cart list: ${snapshot.error}");
                    return Center(
                      child: Text("Error loading cart list"),
                    );
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Card(
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                  Expanded(
                                    child: Row(children: [
                                      SizedBox(
                                        width: 7,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(
                                          "${Url.product_thumbnail_url}/${snapshot.data![index].thumbnail!}",
                                          height: 90,
                                          width: 100,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        width: 220,
                                        height: 100,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data![index].name!,
                                              textScaleFactor: 1.2,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                snapshot.data![index].slug!,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  snapshot.data![index].price!
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.18,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 2),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      border: Border.all()),
                                                  child: Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {},
                                                        child: Icon(
                                                          Icons.remove,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        snapshot.data![index]
                                                            .quantity!
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      InkWell(
                                                        onTap: () {},
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.black,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ]),
                                  )
                                ])));
                      },
                      shrinkWrap: true,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    );
                  }
                  return Container(); // You can customize the empty state as needed
                },
              );
            }
          },
        ),
      ),
    );
  }
}
