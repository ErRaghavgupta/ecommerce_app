import 'package:ecommerce_app/Routes/routes.dart';
import 'package:ecommerce_app/Screens/cartView.dart';
import 'package:ecommerce_app/Screens/firstView.dart';
import 'package:ecommerce_app/Screens/secondView.dart';
import 'package:flutter/material.dart';

class BottomViewPage extends StatefulWidget {
  const BottomViewPage({super.key});

  @override
  State<BottomViewPage> createState() => _BottomViewPageState();
}

class _BottomViewPageState extends State<BottomViewPage> {
  int selectIndex = 0;
  List listItems = [
    FirstView(),
    SecondView(),
    AddToCart()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listItems[selectIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        elevation: 5,
        indicatorColor: Color(0xffff660e),
        selectedIndex: selectIndex,
        onDestinationSelected: (value) {
          selectIndex = value;
          setState(() {});
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.add_shopping_cart), label: "Cart"),
          NavigationDestination(icon: Icon(Icons.favorite_border), label: "favourite"),
          NavigationDestination(icon: Icon(Icons.person), label: "Login"),
        ],
      ),
    );
  }
}
