class WCClientConfig {
  WCClientConfig._();

  static final _domain = "tu_dominio";
  static final _consumerKey = "tu_clave";
  static final _consumerSecret = "tu_secreto";

  static final _basePath = "wp-json/wc/v3";

  static String authority() => _domain;
  static String path(String endpoint) => "$_basePath/$endpoint";
  static Map<String, String> params(Map<String, String> otherParams) => {
        "consumer_key": _consumerKey,
        "consumer_secret": _consumerSecret,
        ...otherParams,
      };
}
