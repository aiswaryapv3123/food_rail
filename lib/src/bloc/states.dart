import 'package:equatable/equatable.dart';
import 'package:food_rail/src/models/get_category_list_data.dart';
import 'package:food_rail/src/models/get_home_data.dart';

abstract class FoodStates extends Equatable {
  @override
  List<Object> get props => [];
}

/// home states

class HomeInitState extends FoodStates {}

class HomeLoadingState extends FoodStates {}

class HomeLoadedState extends FoodStates {
  final GetHomeData getHomeData;
  HomeLoadedState({this.getHomeData});
}

class HomeErrorState extends FoodStates {
  final error;
  HomeErrorState({this.error});
}


/// category states

class CategoryInitState extends FoodStates {}

class CategoryLoadingState extends FoodStates {}

class CategoryLoadedState extends FoodStates {
  final GetCategoryListData getCategoryListData;
  CategoryLoadedState({this.getCategoryListData});
}

class CategoryErrorState extends FoodStates {
  final error;
  CategoryErrorState({this.error});
}