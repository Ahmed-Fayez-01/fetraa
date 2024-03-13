
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetraa/features/videos/presentation/view_models/get_video_details/get_video_details_cubit.dart';
import 'package:fetraa/features/videos/presentation/views/widgets/similar_video_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/constants.dart';
import 'chewi_list_item.dart';

class VideoDetailsViewBody extends StatefulWidget {
  const VideoDetailsViewBody({super.key, required this.id});

  final String id;

  @override
  State<VideoDetailsViewBody> createState() => _VideoDetailsViewBodyState();
}

class _VideoDetailsViewBodyState extends State<VideoDetailsViewBody> {
  @override
  void initState() {
    context.read<GetVideoDetailsCubit>().getVideoDetails(id: widget.id);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetVideoDetailsCubit, GetVideoDetailsState>(
        builder: (context, state) {
      if (state is UserGetVideoDetailsSuccessState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppConstants.height30(context),
            ),
            state.model.data!.video==""? SizedBox(
                height: MediaQuery.of(context).size.height*.2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
                  child:  ClipRRect(
                    borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
                    child: YoutubePlayer(
                      controller: YoutubePlayerController(
                        initialVideoId: YoutubePlayer.convertUrlToId(state.model.data!.link!)!,
                        flags: const YoutubePlayerFlags(
                          autoPlay: true,
                          mute: false,
                        ),
                      ),
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: AppColors.primaryColor,
                      progressColors: const ProgressBarColors(
                        playedColor: AppColors.primarySwatchColor,
                        handleColor: AppColors.primarySwatchColor,
                      ),
                    ),
                  ),
                )):
            SizedBox(
                height: MediaQuery.of(context).size.height*.2,
                child: ChewieListItem(
                    videoPlayerController: VideoPlayerController.networkUrl(
                      Uri.parse(state.model.data!.video!),),
                    looping: false)),
            // Stack(
            //   alignment: Alignment.center,
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.symmetric(
            //           horizontal: AppConstants.width20(context)),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           ClipRRect(
            //             borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
            //             child: CachedNetworkImage(
            //               placeholder: (context, url) => Shimmer.fromColors(
            //                 baseColor: Colors.grey[400]!,
            //                 highlightColor: Colors.grey[200]!,
            //                 child: Container(
            //                   decoration: BoxDecoration(
            //                     color: Colors.grey,
            //                     borderRadius: BorderRadius.circular(20),
            //                   ),
            //                 ),
            //               ),
            //               errorWidget: (context, url, error) =>
            //                   const Icon(Icons.error),
            //               imageUrl: state.model.data!.img!,
            //               fit: BoxFit.fill,
            //               width: MediaQuery.of(context).size.width -
            //                   AppConstants.width20(context) * 2,
            //               height: MediaQuery.of(context).size.height * .2,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     InkWell(
            //       onTap: (){
            //
            //       },
            //       child: CircleAvatar(
            //         radius: MediaQuery.of(context).size.height * .03,
            //         backgroundColor: const Color(0xff84C245),
            //         child: SvgPicture.asset(
            //           AssetData.arrowRight,
            //           width: MediaQuery.of(context).size.height * .01,
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            SizedBox(
              height: AppConstants.height30(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.width20(context)),
              child: Text(
                state.model.data!.name!,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.of(context).size.height * .022,
                    color: const Color(0xff303030)),
              ),
            ),
            SizedBox(
              height: AppConstants.height10(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.width20(context)),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(AppConstants.width5(context)),
                    decoration: BoxDecoration(
                      color: const Color(0xff8D5EF2),
                      borderRadius:
                          BorderRadius.circular(AppConstants.sp10(context)),
                    ),
                    child: Text(
                      "The Health",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * .014,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    width: AppConstants.width5(context),
                  ),
                  Container(
                    padding: EdgeInsets.all(AppConstants.width5(context)),
                    decoration: BoxDecoration(
                      color: const Color(0xff0082CD),
                      borderRadius:
                          BorderRadius.circular(AppConstants.sp10(context)),
                    ),
                    child: Text(
                      "Thinness",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * .014,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    width: AppConstants.width5(context),
                  ),
                  Container(
                    padding: EdgeInsets.all(AppConstants.width5(context)),
                    decoration: BoxDecoration(
                      color: const Color(0xff4DC9D1),
                      borderRadius:
                          BorderRadius.circular(AppConstants.sp10(context)),
                    ),
                    child: Text(
                      "Sports",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * .014,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppConstants.height20(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.width20(context)),
              child: Text(
                state.model.data!.desc!,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.height * .018,
                    color: const Color(0xff9D9FA0)),
              ),
            ),
            SizedBox(
              height: AppConstants.height30(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.width20(context)),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .07,
                        width: MediaQuery.of(context).size.height * .07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * .07,
                          ),
                          color: Colors.grey[300],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * .07,
                          ),
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://images.pexels.com/photos/1557652/pexels-photo-1557652.jpeg",
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height * .07,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(
                              color: AppColors.primarySwatchColor,
                            )),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                            MediaQuery.of(context).size.height * .001,
                            MediaQuery.of(context).size.height * .05),
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.height * .01,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                              radius: MediaQuery.of(context).size.height * .007,
                              backgroundColor: const Color(0xff27AE60)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: AppConstants.width10(context),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ahmed Fayez",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .02,
                              color: const Color(0xff303030),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: AppConstants.height5(context),
                        ),
                        Text(
                          "Nutritional specialist",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * .014,
                              color: const Color(0xff9D9FA0),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: AppConstants.height20(context),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: state.model.videos!.length,
                itemBuilder: (BuildContext context, int index) {
                  return SimilarVideoItem(instance: state.model.videos![index],);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: AppConstants.height10(context),
                  );
                },
              ),
            ),
          ],
        );
      } else {
        return Column(
          children: [
            SizedBox(
              height: AppConstants.height20(context) * 3,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.sp20(context)),
                child: ListView.separated(
                  itemCount: 4,
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[200]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: MediaQuery.of(context).size.height * .02,
                          width: MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                            color: const Color(0xffA5a5a5),
                            borderRadius: BorderRadius.circular(
                                AppConstants.sp10(context)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppConstants.height10(context),
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[200]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: MediaQuery.of(context).size.height * .02,
                          width: MediaQuery.of(context).size.width * .8,
                          decoration: BoxDecoration(
                            color: const Color(0xffA5a5a5),
                            borderRadius: BorderRadius.circular(
                                AppConstants.sp10(context)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppConstants.height10(context),
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[200]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: MediaQuery.of(context).size.height * .2,
                          decoration: BoxDecoration(
                            color: const Color(0xffA5a5a5),
                            borderRadius: BorderRadius.circular(
                                AppConstants.sp10(context)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: AppConstants.height10(context),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      }
    });
  }
}
