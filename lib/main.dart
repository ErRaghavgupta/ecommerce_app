import 'dart:io';
import 'package:ecommerce_app/Screens/bottom_view_page.dart';
import 'package:ecommerce_app/Screens/registerView.dart';
import 'package:ecommerce_app/Screens/secondView.dart';
import 'package:flutter/material.dart';
import 'Routes/routes.dart';
import 'Screens/cartView.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: INITIAL_ROUTE,
      onGenerateRoute: (settings) {
        if (settings.name == INITIAL_ROUTE) {
          return MaterialPageRoute(
            builder: (context) => BottomViewPage(),
          );
        } else if (settings.name == SECOND_ROUTE) {
          final args = settings.arguments as int;
          return MaterialPageRoute(
            builder: (context) => SecondView(getIndex: args),
          );
        } else if (settings.name == CART_ROUTE) {
          return MaterialPageRoute(
            builder: (context) => AddToCart(),
          );
        }
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
