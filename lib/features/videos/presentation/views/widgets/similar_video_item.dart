import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetraa/features/videos/presentation/view_models/get_video_details/get_video_details_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/constants.dart';
import '../../../data/models/video_details_model.dart';

class SimilarVideoItem extends StatelessWidget {
  const SimilarVideoItem({super.key, required this.instance});
final Videos instance;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
      child: InkWell(
        onTap: (){
          context.read<GetVideoDetailsCubit>().getVideoDetails(id: instance.id.toString());
        },
        child: Container(
            padding: EdgeInsets.all(AppConstants.sp10(context)),
            decoration: BoxDecoration(
                color: const Color(0xffF6F7FA),
                borderRadius: BorderRadius.circular(AppConstants.sp10(context))
            ),
            child:Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
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
                        width: MediaQuery.of(context).size.width*.2,
                        height: MediaQuery.of(context).size.width*.2,
                      ),
                    ),
                    SvgPicture.asset(AssetData.play,width: MediaQuery.of(context).size.width*.12,),
                  ],
                ),
                SizedBox(width: AppConstants.width10(context),),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(instance.name!,
                        maxLines: 2,
                        overflow:TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: MediaQuery.of(context).size.height*.016,
                            color: const Color(0xff303030)
                        ),),
                      SizedBox(height: AppConstants.height5(context),),
                      Text("04:10m",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.height*.018,
                            color: const Color(0xff8C8C8C)
                        ),),
                    ],
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
