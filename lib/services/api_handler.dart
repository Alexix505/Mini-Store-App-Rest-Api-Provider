import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_store_app_with_restapi_and_provider/const/api_consts.dart';

import '../models/product_model.dart';

class APIHandler {
  static Future<List<ProductsModel>> getAllProducts() async {
    var uri = Uri.https(BASE_URL, 'api/v1/products');

    var response = await http.get(
      uri,
    );

    // final response = await http.get(Uri.parse("https://api.escuelajs.co/api/v1/products"));

    // print('response ${jsonDecode(response.body)}');

    var data = jsonDecode(response.body);
    var tempList = [];

    for (var v in data) {
      tempList.add(v);
      // print('v $v \n\n');
    }
    return ProductsModel.productsFromSnapshot(tempList);
  }
}
