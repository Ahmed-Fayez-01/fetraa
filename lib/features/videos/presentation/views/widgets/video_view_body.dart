import 'package:fetraa/core/shared_widgets/video_tabs.dart';
import 'package:fetraa/features/videos/presentation/view_models/change_video_tabs_cubit/change_video_tabs_cubit.dart';
import 'package:fetraa/features/videos/presentation/views/video_details_view.dart';
import 'package:fetraa/features/videos/presentation/views/widgets/video_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/constants.dart';
import '../../view_models/change_video_tabs_cubit/change_video_tabs_states.dart';
import '../../view_models/get_all_categories_video/get_all_categories_video_cubit.dart';
import '../../view_models/get_videos_by_id/get_videos_by_id_cubit.dart';

class VideoViewBody extends StatefulWidget {
  const VideoViewBody({super.key});

  @override
  State<VideoViewBody> createState() => _VideoViewBodyState();
}

class _VideoViewBodyState extends State<VideoViewBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppConstants.height20(context),
        ),
        BlocConsumer<GetAllCategoriesVideoCubit, GetAllCategoriesVideoState>(
          builder: (context, state) {
            if (state is UserGetAllCategoriesVideoSuccessState) {
              return CustomVideoVideosTabsItem(
                categories: state.model,
              );
            } else {
              return SizedBox(
                height: MediaQuery.of(context).size.height * .05,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.sp20(context)),
                  child: ListView.separated(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Shimmer.fromColors(
                      baseColor: Colors.grey[200]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: MediaQuery.of(context).size.height * .045,
                        width: MediaQuery.of(context).size.width * .25,
                        decoration: BoxDecoration(
                          color: const Color(0xffA5a5a5),
                          borderRadius:
                              BorderRadius.circular(AppConstants.sp10(context)),
                        ),
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: AppConstants.width10(context),
                      );
                    },
                  ),
                ),
              );
            }
          },
          listener: (BuildContext context, state) {
            if (state is UserGetAllCategoriesVideoSuccessState) {
              context
                  .read<GetVideosByIdCubit>()
                  .getVideosById(type: state.model.data![0].name.toString());
            }
          },
        ),
        SizedBox(
          height: AppConstants.height20(context),
        ),
        BlocBuilder<ChangeVideosTabsCubit, ChangeVideosTabsStates>(
            builder: (context, state) {
          return BlocBuilder<GetVideosByIdCubit, GetVideosByIdState>(
              builder: (context, state) {
            if (state is UserGetVideosByIdSuccessState) {
              return Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.symmetric(
                        vertical: AppConstants.height10(context),
                        horizontal: AppConstants.width20(context)),
                    itemCount: state.model.data!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: AppConstants.width10(context),
                        mainAxisSpacing: AppConstants.height10(context),
                        childAspectRatio: .8),
                    itemBuilder: (context, index) {
                      return VideoItem(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoDetailsView(
                                        id: state.model.data![index].id
                                            .toString(),
                                      )));
                        },
                        instance: state.model.data![index],
                      );
                    }),
              );
            } else {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.sp20(context)),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: AppConstants.width10(context),
                        mainAxisSpacing: AppConstants.height10(context),
                        childAspectRatio: 0.9),
                    itemCount: 6,
                    itemBuilder: (context, index) => Shimmer.fromColors(
                      baseColor: Colors.grey[200]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: MediaQuery.of(context).size.height * .16,
                        decoration: BoxDecoration(
                          color: const Color(0xffA5a5a5),
                          borderRadius:
                              BorderRadius.circular(AppConstants.sp10(context)),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          });
        }),
      ],
    );
  }
}
