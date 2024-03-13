
import 'package:fetraa/features/blogs/presentation/view_models/get_blogs_by_id/get_blogs_by_id_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/blogs/data/models/category_blodg_model.dart';
import '../../features/blogs/presentation/view_models/change_tabs_cubit/change_tabs_cubit.dart';
import '../../features/blogs/presentation/view_models/change_tabs_cubit/change_tabs_states.dart';
import '../utils/colors/colors.dart';
import '../utils/constants.dart';
import '../utils/text_styles/styles.dart';

class CustomTabsItem extends StatelessWidget {
  const CustomTabsItem({super.key, required this.categories});

  final CategoryBlogsModel categories;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeTabsCubit, ChangeTabsStates>(
        builder: (context, state) {
      return SizedBox(
        height: MediaQuery.of(context).size.height*.05,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                context.read<ChangeTabsCubit>().changeTabs(index);
                context.read<GetBlogsByIdCubit>().getBlogsById(id: categories.data![index].id.toString());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  index==0?SizedBox(width: AppConstants.width20(context),):const SizedBox(),
                  // index==0?Container(
                  //   padding: EdgeInsets.symmetric(
                  //       horizontal: AppConstants.width20(context),
                  //       vertical: AppConstants.height10(context)),
                  //   margin: EdgeInsetsDirectional.only(
                  //       end: AppConstants.width10(context)),
                  //   decoration: BoxDecoration(
                  //     color: context.read<ChangeTabsCubit>().selectedTab == index
                  //         ? AppColors.primaryColor
                  //         :const Color(0xffFAFAFA),
                  //     borderRadius:
                  //         BorderRadius.circular(AppConstants.width5(context)),
                  //     // color:
                  //   ),
                  //   child: Text(
                  //     "all".tr(),
                  //     style: Styles.title12(context).copyWith(
                  //       color: context.read<ChangeTabsCubit>().selectedTab == index
                  //           ? Colors.white
                  //           : const Color(0xff9A9999),
                  //       fontWeight:context.read<ChangeTabsCubit>().selectedTab == index ? FontWeight.w600 :FontWeight.w500,
                  //     ),
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ):
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.width20(context),
                        vertical: AppConstants.height10(context)),
                    margin: EdgeInsetsDirectional.only(
                        end: AppConstants.width10(context)),
                    decoration: BoxDecoration(
                      color: context.read<ChangeTabsCubit>().selectedTab == index
                          ? AppColors.primaryColor
                          :const Color(0xffFAFAFA),
                      borderRadius:
                      BorderRadius.circular(AppConstants.width5(context)),
                      // color:
                    ),
                    child: Text(
                      categories.data![index].name!,
                      style: Styles.title12(context).copyWith(
                        color: context.read<ChangeTabsCubit>().selectedTab == index
                            ? Colors.white
                            : const Color(0xff9A9999),
                        fontWeight:context.read<ChangeTabsCubit>().selectedTab == index ? FontWeight.w600 :FontWeight.w500,
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
