import 'package:demo_woocommerce/providers/product_provider.dart';
import 'package:demo_woocommerce/searchs/product_search_result.dart';
import 'package:flutter/material.dart';

class ProductSearchDelegate extends SearchDelegate {
  final productProvider = ProductProvider();
  var seleccion = '';

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de nuestro AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a mostrar
    if (query.isEmpty) {
      return Container();
    }

    return ProductSearchResult(query);
  }

  /* @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando la persona escribe
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: productProvider.getAll(perPage: 10, search: query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data as List<ProductModel>;

          return ListView(
            children: ListTile.divideTiles(
              context: context,
              tiles: products.map((product) {
                return ListTile(
                  title: Text(product.name,
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                  /* subtitle: Text(product.description,
                      maxLines: 1, overflow: TextOverflow.ellipsis), */
                  onTap: () {
                    close(context, null);
                    // pelicula.uniqueId = '';
                    Navigator.pushNamed(context, ProductDetailPage.routeName,
                        arguments: product);
                  },
                );
              }).toList(),
            ).toList(),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  } */

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando la persona escribe
    return Container();
  }
}
