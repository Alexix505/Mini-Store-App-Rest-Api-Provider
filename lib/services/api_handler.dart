import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_store_app_with_restapi_and_provider/const/api_consts.dart';

class APIHandler {
  static Future<void> getAllProducts() async {
    var uri = Uri.https(BASE_URL, 'api/v1/products');

    var response = await http.get(
      uri,
    );

    print('response ${jsonDecode(response.body)}');
  }
}
