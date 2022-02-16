import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_rail/src/models/get_home_data.dart' as banner;
import 'package:food_rail/src/utils/constants.dart';
import 'package:food_rail/src/utils/utils.dart';

class AdditionalBanners extends StatelessWidget {
  final List<String> additionalBanners;
  const AdditionalBanners({Key key, this.additionalBanners}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: additionalBanners.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (ctx, index) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  width: width(context, width: 1),
                  height: height(context, height: 5),
                  imageUrl: additionalBanners[index],
                  fit: BoxFit.fill,
                  imageBuilder: (context, img) {
                    return Container(
                      width: width(context, width: 1),
                      height: height(context, height: 5),
                      // margin: EdgeInsets.only(right: width(context, width: 30)),
                      decoration: BoxDecoration(
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
                        valueColor: AlwaysStoppedAnimation(Constants.colors[2]),
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
                  height: height(context, height: 120),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
