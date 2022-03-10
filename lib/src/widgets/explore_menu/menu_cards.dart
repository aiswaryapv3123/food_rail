import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_rail/src/models/get_products.dart';
import 'package:food_rail/src/utils/constants.dart';
import 'package:food_rail/src/utils/utils.dart';
import 'package:food_rail/src/widgets/food_card/add_button.dart';
import 'package:food_rail/src/widgets/food_card/veg_indicator.dart';

class MenuCard extends StatefulWidget {
  final Function onAddItem;
  final Product products;
  const MenuCard({Key key, this.onAddItem, this.products}) : super(key: key);

  @override
  _MenuCardState createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            width: screenHeight(context, dividedBy: 1),
            height: screenHeight(context, dividedBy: 3),
            imageUrl: widget.products.image == null
                ? "https://image.shutterstock.com/image-vector/image-not-found-grayscale-photo-260nw-1737334631.jpg"
                : widget.products.image,
            fit: BoxFit.cover,
            imageBuilder: (context, img) {
              return Container(
                  width: screenHeight(context, dividedBy: 1),
                  height: screenHeight(context, dividedBy: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: img,
                    ),
                  ),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: screenWidth(context, dividedBy: 30),
                            bottom: screenWidth(context, dividedBy: 30)),
                        child: Icon(Icons.favorite_border, color: Colors.grey),
                      )));
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
            height: screenHeight(context, dividedBy: 70),
          ),
          Row(
            children: [
              SizedBox(width: screenWidth(context, dividedBy: 50)),
              VegIndicator(
                vegetarian: false,
              ),
              SizedBox(width: screenWidth(context, dividedBy: 50)),
              Text(
                  widget.products.name == null
                      ? "Not available"
                      : widget.products.name,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontFamily: "Exo-Regular",
                      fontWeight: FontWeight.w600)),
            ],
          ),
          SizedBox(
            height: screenHeight(context, dividedBy: 90),
          ),
          Container(
            width: screenWidth(context, dividedBy: 1),
            child: Row(
              children: [
                SizedBox(width: screenWidth(context, dividedBy: 50)),
                Text(
                  "C\$ " + widget.products.price == null
                      ? "10"
                      : widget.products.price,
                  style: TextStyle(
                      fontSize: 17,
                      color: Constants.colors[2],
                      fontFamily: "Exo-Regular",
                      fontWeight: FontWeight.w700),
                ),
                Spacer(),
                AddButton(
                  label: "Add",
                  onPressed: widget.onAddItem,
                ),
                SizedBox(width: screenWidth(context, dividedBy: 30)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
