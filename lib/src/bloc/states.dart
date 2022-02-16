import 'package:equatable/equatable.dart';
import 'package:food_rail/src/models/get_home_data.dart';

abstract class FoodStates extends Equatable {
  @override
  List<Object> get props => [];
}

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