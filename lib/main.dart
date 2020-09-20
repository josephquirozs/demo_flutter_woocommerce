import 'package:demo_woocommerce/pages/home_page.dart';
import 'package:demo_woocommerce/pages/product_detail_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        ProductDetailPage.routeName: (BuildContext context) =>
            ProductDetailPage(),
      },
    );
  }
}
