
import 'package:fetraa/features/videos/data/models/video_categories.dart';
import 'package:fetraa/features/videos/presentation/view_models/get_videos_by_id/get_videos_by_id_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/videos/presentation/view_models/change_video_tabs_cubit/change_video_tabs_cubit.dart';
import '../../features/videos/presentation/view_models/change_video_tabs_cubit/change_video_tabs_states.dart';
import '../utils/colors/colors.dart';
import '../utils/constants.dart';
import '../utils/text_styles/styles.dart';

class CustomVideoVideosTabsItem extends StatelessWidget {
  const CustomVideoVideosTabsItem({super.key, required this.categories});

  final VideoCategoriesModel categories;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeVideosTabsCubit, ChangeVideosTabsStates>(
        builder: (context, state) {
          return SizedBox(
            height: MediaQuery.of(context).size.height*.05,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    context.read<ChangeVideosTabsCubit>().changeVideosTabs(index);
                    context.read<GetVideosByIdCubit>().getVideosById(type: categories.data![index].name!);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      index==0?SizedBox(width: AppConstants.width20(context),):const SizedBox(),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppConstants.width20(context),
                            vertical: AppConstants.height10(context)),
                        margin: EdgeInsetsDirectional.only(
                            end: AppConstants.width10(context)),
                        decoration: BoxDecoration(
                          color: context.read<ChangeVideosTabsCubit>().selectedTab == index
                              ? AppColors.primaryColor
                              :const Color(0xffFAFAFA),
                          borderRadius:
                          BorderRadius.circular(AppConstants.width5(context)),
                          // color:
                        ),
                        child: Text(
                          categories.data![index].name!,
                          style: Styles.title12(context).copyWith(
                            color: context.read<ChangeVideosTabsCubit>().selectedTab == index
                                ? Colors.white
                                : const Color(0xff9A9999),
                            fontWeight:context.read<ChangeVideosTabsCubit>().selectedTab == index ? FontWeight.w600 :FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: categories.data!.length,
            ),
          );
        });
  }
}
