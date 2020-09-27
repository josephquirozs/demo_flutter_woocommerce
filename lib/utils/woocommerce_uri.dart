import 'package:flutter/cupertino.dart';

class WooCommerceUri {
  static final _basePath = "wp-json/wc/v3";

  WooCommerceUri._();

  static Uri build({
    @required String domain,
    @required String consumerKey,
    @required String consumerSecret,
    @required String endpoint,
    Map<String, String> params,
  }) {
    final path = "$_basePath/$endpoint";
    final Map<String, String> moreParams = {
      ...params,
      "consumer_key": consumerKey,
      "consumer_secret": consumerSecret,
    };

    return Uri.https(domain, path, moreParams);
  }
}
