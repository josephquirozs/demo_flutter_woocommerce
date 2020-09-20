import 'package:demo_woocommerce/models/product_model.dart';
import 'package:demo_woocommerce/providers/wc_oauth_client.dart';

class ProductProviderOld {
  final endpoint = 'products';

  Future<List<ProductModel>> getAll(
      {int page = 1, int perPage = 10, String search = ''}) async {
    print('Ejecutando getAll()');

    // Recuperamos el cuerpo de la respuesta decodificada
    var decodedBody = await WCOAuthClient.instance
            .getAsync("$endpoint?page=$page&per_page=$perPage&search=$search")
        as List<dynamic>;

    // Convertimos los datos crudos en modelos
    var products = List<ProductModel>();
    decodedBody.forEach((element) {
      var product = ProductModel.fromJson(element);
      products.add(product);
    });

    print('Resultados cantidad: ${products.length}');
    return products;
  }
}
