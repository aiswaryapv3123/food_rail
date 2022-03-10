import 'dart:convert';
import 'dart:io';

import 'package:food_rail/src/models/get_category_list_data.dart';
import 'package:food_rail/src/models/get_home_data.dart';
import 'package:food_rail/src/models/get_products.dart';
import 'package:food_rail/src/models/request_products.dart';
import 'package:food_rail/src/utils/urls.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class FoodHomeRepo {
  Future<GetHomeData> getHomeData();
  Future<GetCategoryListData> getcategories();
  Future<GetProducts> requestProducts({String productId});
}

class FoodServices implements FoodHomeRepo {
  // Map<String, String> requestHeaders = {
  //   'Authorization': 'Bearer akhil@intertoons.com'
  // };

  @override
  Future<GetHomeData> getHomeData() async {
    // TODO: implement getHomeData
    print("FOOD SERVICES");
    print("FOOD SERVICES" + Urls.baseUrl);
    print("FOOD SERVICES" + Urls.homeUrl);
    // var uri = Uri.http(Urls.baseUrl, Urls.homeUrl);
    final response = await http.get(
      Uri.parse('http://fda.intertoons.com/api/V1/home'),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer akhil@intertoons.com',
      },
    );
    print("Response");
    print(response);
    GetHomeData homeData = getHomeDataFromJson(response.body);
    return homeData;
  }


  @override
  Future<GetCategoryListData> getcategories() async {
    // TODO: implement getcategories
    final response = await http.get(
      Uri.parse('http://fda.intertoons.com/api/V1/categories'),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer akhil@intertoons.com',
      },
    );
    print("Response");
    print(response);
    GetCategoryListData categoryListData =
        getCategoryListDataFromJson(response.body);
    return categoryListData;
  }

  @override
  Future<GetProducts> requestProducts({String productId}) async {
    // TODO: implement requestProducts
    Map<String, dynamic> payload = {
      "currentpage": 1,
      "pagesize": 100,
      "sortorder": {"field": "menu_name", "direction": "desc"},
      "searchstring": "",
      "filter": {"category": productId}
    };
    Response response = await http.post(
        Uri.parse('http://fda.intertoons.com/api/V1/products'),
        body: json.encode(payload));
    if (response.statusCode == 201) {
      GetProducts getProducts = getProductsFromJson(jsonDecode(response.body));
      return getProducts;
    } else {
      throw Exception('Failed to create Request');
    }
  }
}
