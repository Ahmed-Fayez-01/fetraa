import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetraa/core/utils/colors/colors.dart';
import 'package:fetraa/features/videos/data/models/video_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/constants.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({super.key, required this.onTap, required this.instance});
final Function() onTap;
final Data instance;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor,width: 3),
                        borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
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
                          width: MediaQuery.of(context).size.width*.4,
                          height: MediaQuery.of(context).size.width*.4,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:AppConstants.sp10(context),vertical: AppConstants.height20(context)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xE8ffffff),
                      borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: MediaQuery.of(context).size.height*.03,
                  backgroundColor: const Color(0xff84C245),
                  child: SvgPicture.asset(AssetData.arrowRight,width: MediaQuery.of(context).size.height*.01,),
                )
              ],
            ),
          ),
          Text(instance.name!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height*.018,
              fontWeight: FontWeight.w600,
            ),)
        ],
      ),
    );
  }
}
