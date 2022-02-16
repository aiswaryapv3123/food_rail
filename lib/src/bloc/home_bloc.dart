import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_rail/src/api/exceptions.dart';
import 'package:food_rail/src/api/services.dart';
import 'package:food_rail/src/bloc/events.dart';
import 'package:food_rail/src/bloc/states.dart';
import 'package:food_rail/src/models/get_home_data.dart';

class HomeBloc extends Bloc<FoodEvents, FoodStates> {
  final FoodHomeRepo foodHomeRepo;
  GetHomeData getHomeData;
  HomeBloc({this.foodHomeRepo, this.getHomeData}) : super(HomeInitState());
  @override
  Stream<FoodStates> mapEventToState(FoodEvents event) async* {
    // TODO: implement mapEventToState
    switch (event) {
      case FoodEvents.fetchHomeData:
        yield HomeLoadingState();
        try {
          getHomeData = await foodHomeRepo.getHomeData();
          print("Results");
          print(getHomeData.data);
          yield HomeLoadedState(getHomeData: getHomeData);
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
