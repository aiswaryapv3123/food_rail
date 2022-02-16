import 'package:flutter/material.dart';
import 'package:food_rail/src/bloc/events.dart';
import 'package:food_rail/src/bloc/home_bloc.dart';
import 'package:food_rail/src/bloc/states.dart';
import 'package:food_rail/src/models/get_home_data.dart';
import 'package:food_rail/src/screens/home_content.dart';
import 'package:food_rail/src/utils/constants.dart';
import 'package:food_rail/src/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_rail/src/widgets/home/image_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> sliderImages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  _loadData() async {
    context.bloc<HomeBloc>().add(FoodEvents.fetchHomeData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: height(context, height: 10),
        elevation: 0,
        leading: Container(),
        actions: [
          Container(
            width: width(context, width: 1),
            // height: height(context, height: 30),
            padding: EdgeInsets.only(
                left: width(context, width: 40),
                top: height(context, height: 70)),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Deliver to",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontFamily: "Exo-Regular",
                        fontWeight: FontWeight.w700)),
                SizedBox(
                  height: height(context, height: 60),
                ),
                Container(
                    width: width(context, width: 3),
                    child: Divider(color: Constants.colors[3], thickness: 2)),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: BlocBuilder<HomeBloc, FoodStates>(
              builder: (BuildContext context, FoodStates state) {
            if (state is HomeErrorState) {
              final error = state.error;
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                child: Center(
                  child: Text(
                    error.message,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Constants.colors[1],
                        fontFamily: "Exo-Regular"),
                  ),
                ),
              );
            }
            if (state is HomeLoadedState) {
              print("Loaded State");
              GetHomeData homeData = state.getHomeData;
              return HomeContent(
                // images:sliderImages,
                homeData: homeData,
              );
            }
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Center(
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Constants.colors[1],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
