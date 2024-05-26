import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_store_app_with_restapi_and_provider/const/api_consts.dart';
import 'package:mini_store_app_with_restapi_and_provider/models/categories_model.dart';

import '../models/product_model.dart';
import '../models/users_model.dart';

class APIHandler {
  static Future<List<dynamic>> getData({required String target}) async {
    var uri = Uri.https(BASE_URL, 'api/v1/$target');

    var response = await http.get(
      uri,
    );

    var data = jsonDecode(response.body);
    var tempList = [];

    for (var v in data) {
      tempList.add(v);
      // print('v $v \n\n');
    }
    return tempList;
  }

  static Future<List<ProductsModel>> getAllProducts() async {
    List temp = await getData(target: "products");

    return ProductsModel.productsFromSnapshot(temp);

    // var uri = Uri.https(BASE_URL, 'api/v1/products');

    // var response = await http.get(
    //   uri,
    // );

    // // final response = await http.get(Uri.parse("https://api.escuelajs.co/api/v1/products"));

    // // print('response ${jsonDecode(response.body)}');

    // var data = jsonDecode(response.body);
    // var tempList = [];

    // for (var v in data) {
    //   tempList.add(v);
    // print('v $v \n\n');
    // }
    // return ProductsModel.productsFromSnapshot(tempList);
  }

  static Future<List<CategoriesModel>> getAllCategories() async {
    List temp = await getData(target: "categories");
    return CategoriesModel.categoriesFromSnapshot(temp);
  }

  static Future<List<UsersModel>> getAllUsers() async {
    List temp = await getData(target: "users");
    return UsersModel.allUsersFromSnapshot(temp);
  }

  static Future<ProductsModel> getProductById({required String id}) async {
    var uri = Uri.https(BASE_URL, 'api/v1/products/$id');

    var response = await http.get(
      uri,
    );

    var data = jsonDecode(response.body);

    return ProductsModel.fromJson(data);
  }
}
