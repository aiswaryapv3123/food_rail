import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_rail/src/models/get_home_data.dart';
import 'package:food_rail/src/utils/constants.dart';
import 'package:food_rail/src/utils/utils.dart';
import 'package:food_rail/src/widgets/food_card/add_button.dart';
import 'package:food_rail/src/widgets/food_card/veg_indicator.dart';

class FeaturedFood extends StatefulWidget {
  final List<FeaturedProduct> featuredProducts;
  const FeaturedFood({Key key, this.featuredProducts}) : super(key: key);

  @override
  _FeaturedFoodState createState() => _FeaturedFoodState();
}

class _FeaturedFoodState extends State<FeaturedFood> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context, width: 1),
      height: height(context, height: 3.3),
      // color: Colors.amber,
      child: ListView.builder(
        itemCount: widget.featuredProducts.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  width: height(context, height: 4),
                  height: height(context, height: 5),
                  imageUrl: widget.featuredProducts[index].image,
                  fit: BoxFit.fill,
                  imageBuilder: (context, img) {
                    return Container(
                      width: height(context, height: 4),
                      height: height(context, height: 5),
                      margin: EdgeInsets.only(right: width(context, width: 30)),
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(10),
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
                SizedBox(
                  height: height(context, height: 70),
                ),
                Row(
                  children: [
                    SizedBox(width: width(context, width: 50)),
                    VegIndicator(
                      vegetarian: widget.featuredProducts[index].isVeg == "1"
                          ? true
                          : false,
                    ),
                    SizedBox(width: width(context, width: 50)),
                    Text(widget.featuredProducts[index].name,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontFamily: "Exo-Regular",
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                SizedBox(
                  height: height(context, height: 70),
                ),
                Row(
                  children: [
                    SizedBox(width: width(context, width: 50)),
                    AddButton(
                      label: "Add",
                      onPressed: () {},
                    ),
                    SizedBox(width: width(context, width: 50)),
                    Text("C\$ "+widget.featuredProducts[index].price,
                        style: TextStyle(
                            fontSize: 12,
                            color: Constants.colors[2],
                            fontFamily: "Exo-Regular",
                            fontWeight: FontWeight.w700)),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
