import 'package:woocommerce_api/woocommerce_api.dart';

class WCOAuthClient {
  WCOAuthClient._();

  static final instance = WooCommerceAPI(
    url: "tu_dominio",
    consumerKey: "tu_clave",
    consumerSecret: "tu_secreto",
  );
}
