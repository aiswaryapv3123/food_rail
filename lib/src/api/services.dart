import 'dart:io';

import 'package:food_rail/src/models/get_home_data.dart';
import 'package:food_rail/src/utils/urls.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class FoodHomeRepo {
  Future<GetHomeData> getHomeData();
}

class FoodServices implements FoodHomeRepo {
  Map<String, String> requestHeaders = {
    'Authorization': 'Bearer akhil@intertoons.com'
  };

  @override
  Future<GetHomeData> getHomeData() async {
    // TODO: implement getHomeData
    print("FOOD SERVICES");
    print("FOOD SERVICES"+Urls.baseUrl);
    print("FOOD SERVICES"+Urls.homeUrl);
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
}
