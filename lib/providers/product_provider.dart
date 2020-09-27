import 'dart:convert';
import 'package:demo_woocommerce/models/product_model.dart';
import 'package:demo_woocommerce/providers/my_woocommerce_config.dart';
import 'package:demo_woocommerce/utils/woocommerce_uri.dart';
import 'package:http/http.dart' as http;

class ProductProvider {
  final endpoint = 'products';

  Future<List<ProductModel>> getAll({
    int page = 1,
    int perPage = 10,
    String search = '',
  }) async {
    print('Ejecutando getAll()');

    // Realizamos la petición GET
    final url = WooCommerceUri.build(
      domain: MyWooCommerceConfig.domain,
      consumerKey: MyWooCommerceConfig.consumerKey,
      consumerSecret: MyWooCommerceConfig.consumerSecret,
      endpoint: endpoint,
      params: {
        'page': page.toString(),
        'per_page': perPage.toString(),
        'search': search,
      },
    );
    print('Petición url: $url');

    final response = await http.get(url);
    print('Respuesta status: ${response.statusCode}');
    print('Respuesta body: ${response.body}');

    // Decodificamos el cuerpo de la respuesta
    final decodedBody = json.decode(response.body) as List<dynamic>;

    // Convertimos los datos crudos en modelos
    final results = List<ProductModel>();
    decodedBody.forEach((element) {
      final result = ProductModel.fromJson(element);
      results.add(result);
    });

    print('Resultados cantidad: ${results.length}');
    return results;
  }
}
