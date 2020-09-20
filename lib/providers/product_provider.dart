import 'dart:convert';
import 'package:demo_woocommerce/models/product_model.dart';
import 'package:demo_woocommerce/providers/wc_client_config.dart';
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
    var url = Uri.https(
      WCClientConfig.authority(),
      WCClientConfig.path(endpoint),
      WCClientConfig.params({
        'page': page.toString(),
        'per_page': perPage.toString(),
        'search': search,
      }),
    );
    print('Petición url: $url');

    var response = await http.get(url);
    print('Respuesta status: ${response.statusCode}');
    print('Respuesta body: ${response.body}');

    // Decodificamos el cuerpo de la respuesta
    var decodedBody = json.decode(response.body) as List<dynamic>;

    // Convertimos los datos crudos en modelos
    var results = List<ProductModel>();
    decodedBody.forEach((element) {
      var result = ProductModel.fromJson(element);
      results.add(result);
    });

    print('Resultados cantidad: ${results.length}');
    return results;
  }
}
