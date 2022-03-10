import 'package:flutter/material.dart';
import 'package:food_rail/src/models/get_products.dart';
import 'package:food_rail/src/utils/constants.dart';
import 'package:food_rail/src/utils/utils.dart';
import 'package:food_rail/src/widgets/cart/count_button.dart';

class CartCard extends StatefulWidget {
  final Product product;
  final ValueChanged<double> onCountChanged;
  final double total;
  const CartCard({Key key, this.onCountChanged, this.product, this.total})
      : super(key: key);

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int itemCount = 1;
  double totalAmount = 0;
  double cartAmount = 0;
  List<int> itemCountlist=[];

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      cartAmount = widget.total;
      print("Total cart amount " + totalAmount.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, dividedBy: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                widget.product.name,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Constants.colors[1],
                    fontFamily: "Exo-Regular"),
              ),
              SizedBox(
                height: screenHeight(context, dividedBy: 80),
              ),
              Container(
                width: screenWidth(context, dividedBy: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            if (itemCount > 0) itemCount = itemCount - 1;
                            totalAmount =
                                (itemCount *
                                    double.parse(widget.product.price));
                            cartAmount = cartAmount - totalAmount + (double.parse(widget.product.price));
                            print("total amount after decrementing  "+ widget.product.name+" "+ totalAmount.toString());
                            print("total cart amount  "+ cartAmount.toString());
                          });
                          widget.onCountChanged(cartAmount);
                        },
                        child: Icon(
                          Icons.remove,
                          size: 17,
                          color: Colors.black,
                        )),
                    Spacer(),
                    Text(
                      itemCount.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          itemCount = itemCount + 1;
                          totalAmount =
                              (itemCount * double.parse(widget.product.price));
                          cartAmount =  cartAmount + totalAmount - (double.parse(widget.product.price));

                          print("total amount after icrementing  "+ widget.product.name+" "+ totalAmount.toString());
                          print("---------------------------------------------------");
                          print("total cart amount  "+ cartAmount.toString());
                          print("---------------------------------------------------");

                        });
                        widget.onCountChanged(cartAmount);
                      },
                      child: Icon(
                        Icons.add,
                        size: 17,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              // CountButton(
              //   onItemCountChange: (val) {
              //     setState(() {
              //       itemCount = val;
              //       totalAmount = totalAmount +
              //           (val * double.parse(widget.product.price));
              //     });
              //     widget.onCountChanged(totalAmount);
              //     // print("itemcount" + itemCount.toString());
              //     print(
              //         "total Count of " + widget.product.name + val.toString());
              //     print("total amount in cart " + totalAmount.toString());
              //   },
              // ),
            ],
          ),
          Text(
            "C\$" + widget.product.price,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Constants.colors[2],
                fontFamily: "Exo-Regular"),
          ),
        ],
      ),
    );
  }
}
