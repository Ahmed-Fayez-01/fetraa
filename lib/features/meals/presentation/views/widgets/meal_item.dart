import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/constants.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.backColor, required this.borderColor, required this.title, required this.icon, required this.onTap});
final Color backColor;
final Color borderColor;
final String title;
final String icon;
final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:AppConstants.width20(context),vertical: AppConstants.height30(context)),
        decoration: BoxDecoration(
            color: backColor,
            borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
            border: Border.all(color: borderColor)
        ),
        child: Column(
          children: [
            CachedNetworkImage(
              placeholder: (context, url) =>
                  Shimmer.fromColors(
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[200]!,
                    child:  Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius:
                        BorderRadius.circular(20),
                      ),
                    ),
                  ),
              errorWidget: (context, url, error) =>
              const Icon(Icons.error),
              imageUrl:icon,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
            ),
            SizedBox(height: AppConstants.height20(context),),
            Text(title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height*.016
            ),),
          ],
        ),
      ),
    );
  }
}
