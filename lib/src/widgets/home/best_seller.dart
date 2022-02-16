import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_rail/src/models/get_home_data.dart';
import 'package:food_rail/src/utils/constants.dart';
import 'package:food_rail/src/utils/utils.dart';
import 'package:food_rail/src/widgets/food_card/add_button.dart';
import 'package:food_rail/src/widgets/food_card/veg_indicator.dart';

class BestSeller extends StatefulWidget {
  final List<BestsellerProduct> bestsellerProducts;
  const BestSeller({Key key, this.bestsellerProducts}) : super(key: key);

  @override
  _BestSellerState createState() => _BestSellerState();
}

class _BestSellerState extends State<BestSeller> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context, width: 1),
      // color: Colors.amber,
      child: ListView.builder(
        itemCount: widget.bestsellerProducts.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (ctx, index) {
          return Column(
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CachedNetworkImage(
                      width: width(context, width: 4),
                      height: width(context, width: 5),
                      imageUrl: widget.bestsellerProducts[index].image,
                      fit: BoxFit.cover,
                      imageBuilder: (context, img) {
                        return Container(
                          width: width(context, width: 4),
                          height: width(context, width: 5),
                          margin: EdgeInsets.only(right: width(context, width: 30)),
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
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
                      width: width(context, width: 90),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            VegIndicator(
                              vegetarian:
                                  widget.bestsellerProducts[index].isVeg == "1"
                                      ? true
                                      : false,
                            ),
                            SizedBox(width: width(context, width: 50)),
                            Text(widget.bestsellerProducts[index].name,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AddButton(
                              label: "Add",
                              onPressed: () {},
                            ),
                            SizedBox(width: width(context, width: 50)),
                            Text("C\$ " + widget.bestsellerProducts[index].price,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Constants.colors[2],
                                    fontFamily: "Exo-Regular",
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height(context, height: 40),
              ),
            ],
          );
        },
      ),
    );
  }
}
