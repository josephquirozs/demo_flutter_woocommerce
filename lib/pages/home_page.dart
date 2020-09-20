import 'package:demo_woocommerce/searchs/product_search_delegate.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static final routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo WooCommerce'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProductSearchDelegate(),
                // query: 'Hola'
              );
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          'Bienvido a la app',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
