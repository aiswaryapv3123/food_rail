import 'package:flutter/material.dart';
import 'package:food_rail/src/models/get_home_data.dart';
import 'package:food_rail/src/utils/utils.dart';
import 'package:food_rail/src/widgets/head_text.dart';
import 'package:food_rail/src/widgets/home/additional_banners.dart';
import 'package:food_rail/src/widgets/home/best_seller.dart';
import 'package:food_rail/src/widgets/home/explore_menu.dart';
import 'package:food_rail/src/widgets/home/featured_food.dart';
import 'package:food_rail/src/widgets/home/image_slider.dart';

class HomeContent extends StatefulWidget {
  final GetHomeData homeData;
  // final List<String> images;
  const HomeContent({
    Key key,
    this.homeData,
    // this.images
  }) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<String> sliderImages = [];
  List<String> additionalBanners = [];
  @override
  void initState() {
    // TODO: implement initState
    for (int i = 0; i < widget.homeData.data.sliderBanners.length; i++) {
      setState(() {
        sliderImages.add(widget.homeData.data.sliderBanners[i].bannerImg);
      });
    }
    for (int i = 0; i < widget.homeData.data.additionalBanners.length; i++) {
      setState(() {
        additionalBanners
            .add(widget.homeData.data.additionalBanners[i].bannerImg);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context, dividedBy: 40),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSlider(images: sliderImages),
            SizedBox(
              height: screenHeight(context, dividedBy: 30),
            ),
            HeadText(title: "Explore menu"),
            SizedBox(
              height: screenHeight(context, dividedBy: 40),
            ),
            ExploreMenu(),
            SizedBox(
              height: screenHeight(context, dividedBy: 30),
            ),
            HeadText(title: "Featured"),
            SizedBox(
              height: screenHeight(context, dividedBy: 40),
            ),
            FeaturedFood(
              featuredProducts: widget.homeData.data.featuredProducts,
            ),
            SizedBox(
              height: screenHeight(context, dividedBy: 30),
            ),
            AdditionalBanners(
              additionalBanners: additionalBanners,
            ),
            SizedBox(
              height: screenHeight(context, dividedBy: 40),
            ),
            HeadText(title: "Bestseller"),
            SizedBox(
              height: screenHeight(context, dividedBy: 30),
            ),
            BestSeller(
              bestsellerProducts: widget.homeData.data.bestsellerProducts,
            ),
            SizedBox(
              height: screenHeight(context, dividedBy: 40),
            ),
          ],
        ),
      ),
    );
  }
}
