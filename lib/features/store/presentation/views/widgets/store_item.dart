import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetraa/core/utils/assets/assets.dart';
import 'package:fetraa/features/store/data/models/store_model.dart';
import 'package:fetraa/features/store/presentation/views/store_item_details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/constants.dart';
import 'package:shimmer/shimmer.dart';


class StoreItem extends StatelessWidget {
  const StoreItem({super.key, required this.instance});
  final Data instance;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> StoreItemDetails(id:instance.id.toString(),)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 8,
              spreadRadius: 2,
            )
          ],
          borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.vertical(top:Radius.circular(AppConstants.sp10(context))),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top:Radius.circular(AppConstants.sp10(context))),
                      child: CachedNetworkImage(
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
                        imageUrl:instance.img!,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height:
                        MediaQuery.of(context).size.height * 0.17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: AppConstants.width10(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: AppConstants.height10(context),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          instance.name!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: MediaQuery.of(context).size.height * .016,
                              color: const Color(0xff333333)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppConstants.height5(context),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Price per kilo : ",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height*.015,
                          color: Color(0xff828282)
                        ),),
                        Text(instance.price!,style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.height*.015,
                            color: AppColors.primaryColor
                        ),),
                      ],
                    ),
                    Text("14,000",style: TextStyle(
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.lineThrough,
                        decorationColor:const Color(0xffBDBDBD) ,
                        fontSize: MediaQuery.of(context).size.height*.015,
                        color: const Color(0xffBDBDBD)
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(AppConstants.width5(context)),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primarySwatchColor),
                            borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
                          ),
                          child: Image.asset(AssetData.link),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
