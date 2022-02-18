import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_rail/src/api/exceptions.dart';
import 'package:food_rail/src/api/services.dart';
import 'package:food_rail/src/bloc/events.dart';
import 'package:food_rail/src/bloc/states.dart';
import 'package:food_rail/src/models/get_products.dart';

class Productsbloc extends Bloc<FoodEvents, FoodStates> {
  GetProducts getProducts;
  FoodHomeRepo foodProducts;
  String productId;

  Productsbloc({this.getProducts, this.foodProducts, this.productId})
      : super(ProductsInitState());
  @override
  Stream<FoodStates> mapEventToState(FoodEvents event) async* {
    // TODO: implement mapEventToState
    switch (event) {
      case FoodEvents.getProducts:
        yield ProductsLoadingState();
        try {
          getProducts =
              await foodProducts.requestProducts(productId: productId);
          yield ProductsLoadedState(getProducts: getProducts);
        } on SocketException {
          yield HomeErrorState(error: NoInternetException("No internet"));
        } on HttpException {
          yield HomeErrorState(
            error: NoServiceFoundException('No Service Found'),
          );
        } on FormatException {
          yield HomeErrorState(
            error: InvalidFormatException('Invalid Response format'),
          );
        } catch (e) {
          yield HomeErrorState(
            error: UnknownException('Unknown Error'),
          );
        }
        break;
    }
  }
}
