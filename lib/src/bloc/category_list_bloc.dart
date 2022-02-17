import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_rail/src/api/exceptions.dart';
import 'package:food_rail/src/api/services.dart';
import 'package:food_rail/src/bloc/events.dart';
import 'package:food_rail/src/bloc/states.dart';
import 'package:food_rail/src/models/get_category_list_data.dart';

class CategoryListBloc extends Bloc<FoodEvents, FoodStates> {
  FoodHomeRepo foodCategoryList;
  GetCategoryListData getCategoryListData;

  CategoryListBloc({this.getCategoryListData, this.foodCategoryList})
      : super(CategoryInitState());

  @override
  Stream<FoodStates> mapEventToState(FoodEvents event) async* {
    // TODO: implement mapEventToState
    switch (event) {
      case FoodEvents.fetchCategoryList:
        yield CategoryLoadingState();
        try {
          getCategoryListData = await foodCategoryList.getcategories();
          yield CategoryLoadedState(getCategoryListData: getCategoryListData);
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
