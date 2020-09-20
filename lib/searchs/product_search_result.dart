import 'package:demo_woocommerce/models/product_model.dart';
import 'package:demo_woocommerce/pages/product_detail_page.dart';
import 'package:demo_woocommerce/providers/product_provider.dart';
import 'package:flutter/material.dart';

class ProductSearchResult extends StatelessWidget {
  final productProvider = ProductProvider();
  final String query;

  ProductSearchResult(this.query);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _crearGrilla(),
    );
  }

  Widget _crearGrilla() {
    return FutureBuilder(
      future: productProvider.getAll(perPage: 30, search: query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data as List<ProductModel>;
          return products.isEmpty
              ? Center(
                  child: Text(
                    'No se encontraron resultados',
                    style: TextStyle(fontSize: 24),
                  ),
                )
              : GridView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, i) => _crearItem(context, products[i]),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductModel product) {
    return GestureDetector(
      key: UniqueKey(),
      onTap: () {
        print('Tocado!!! ${product.name}');
        Navigator.pushNamed(context, ProductDetailPage.routeName,
            arguments: product);
      },
      child: Card(
        child: Column(
          children: [
            _crearImagen(product),
            Divider(
              color: Colors.transparent,
              height: 8.0,
            ),
            _crearContenido(product),
          ],
        ),
      ),
    );
  }

  Widget _crearImagen(ProductModel product) {
    final height = 120.0;
    final width = double.infinity;
    final fit = BoxFit.scaleDown;

    return product.images.isEmpty
        ? Image(
            image: AssetImage('assets/no-image.png'),
            height: height,
            width: width,
            fit: fit,
          )
        : FadeInImage(
            image: NetworkImage(product.images[0].src),
            placeholder: AssetImage('assets/jar-loading.gif'),
            height: height,
            width: width,
            fit: fit,
          );
  }

  Widget _crearContenido(ProductModel product) {
    return Padding(
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${product.name}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 10.0),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            'S/ ${product.price}',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
