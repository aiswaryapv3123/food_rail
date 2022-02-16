import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_rail/src/utils/constants.dart';
import 'package:food_rail/src/utils/utils.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key key, this.images}) : super(key: key);
  final List<String> images;

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  bool pause = false;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context, width: 1),
      height: height(context, height: 4),
      // color: Colors.red,
      alignment: Alignment.centerLeft,
      child: CarouselSlider(
        carouselController: carouselController,
        options: CarouselOptions(
          height: height(context, height: 4),
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          autoPlay: true,
          pauseAutoPlayInFiniteScroll: false,
          // autoPlayInterval: Duration(seconds: 3),
          // autoPlayAnimationDuration: Duration(milliseconds: 1000),
          autoPlayCurve: Curves.easeIn,
          scrollPhysics: NeverScrollableScrollPhysics(),
        ),
        items: widget.images
            .map(
              (item) => ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: CachedNetworkImage(
                  width: width(context, width: 1),
                  height: height(context, height: 2),
                  imageUrl: item,
                  fit: BoxFit.fill,
                  imageBuilder: (context, img) {
                    return Container(
                      width: width(context, width: 1),
                      height: height(context, height: 2),
                      margin: EdgeInsets.symmetric(
                          horizontal: width(context, width: 90)),
                      decoration: BoxDecoration(
                        // color: Colors.amber,
                        // color: Colors.transparent,
                        borderRadius: BorderRadius.circular(7),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: img,
                        ),
                      ),
                    );
                  },
                  placeholder: (context, img) => Center(
                    child: SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation(Constants.colors[1]),
                      ),
                    ),
                  ),
                  errorWidget: (_, s, d) => const Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
