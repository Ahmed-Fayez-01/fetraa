import 'package:fetraa/core/utils/constants.dart';
import 'package:fetraa/features/blogs/presentation/view_models/change_tabs_cubit/change_tabs_cubit.dart';
import 'package:fetraa/features/blogs/presentation/view_models/change_tabs_cubit/change_tabs_states.dart';
import 'package:fetraa/features/blogs/presentation/view_models/get_all_categories_blog/get_all_categories_blog_cubit.dart';
import 'package:fetraa/features/blogs/presentation/view_models/get_blogs_by_id/get_blogs_by_id_cubit.dart';
import 'package:fetraa/features/blogs/presentation/views/blog_details_view.dart';
import 'package:fetraa/features/blogs/presentation/views/widgets/blogs_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/shared_widgets/custom_tabs_item.dart';

class BlogsViewBody extends StatefulWidget {
  const BlogsViewBody({super.key});

  @override
  State<BlogsViewBody> createState() => _BlogsViewBodyState();
}

class _BlogsViewBodyState extends State<BlogsViewBody> {
  @override
  void initState()
  {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: AppConstants.height20(context),),
        BlocConsumer<GetAllCategoriesBlogCubit,GetAllCategoriesBlogState>(
          builder: (context,state) {
            if(state is UserGetAllCategoriesBlogSuccessState)
              {
                return CustomTabsItem(categories: state.model ,);
              }else{
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
                          borderRadius: BorderRadius.circular(
                              AppConstants.sp10(context)),
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
            if (state is UserGetAllCategoriesBlogSuccessState) {
              context.read<GetBlogsByIdCubit>().getBlogsById(id: state.model.data![0].id.toString());
            }

          },

        ),
        SizedBox(height: AppConstants.height20(context),),
        BlocBuilder<ChangeTabsCubit,ChangeTabsStates>(
          builder: (context,state) {
            return BlocBuilder<GetBlogsByIdCubit,GetBlogsByIdState>(
              builder: (context,state) {
                if(state is UserGetBlogsByIdSuccessState)
                  {
                    return Expanded(
                      child: ListView.separated(
                        itemCount: state.model.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return  BlogItem(onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> BlogDetailsView(instance: state.model.data![index],)));
                          }, instance: state.model.data![index],);
                        }, separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: AppConstants.height20(context),);
                      },),
                    );
                  }else{
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.sp20(context)),
                      child: ListView.separated(
                        itemCount: 3,
                        itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey[200]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: MediaQuery.of(context).size.height * .02,
                                width: MediaQuery.of(context).size.width*.4,
                                decoration: BoxDecoration(
                                  color: const Color(0xffA5a5a5),
                                  borderRadius:
                                  BorderRadius.circular(AppConstants.sp10(context)),
                                ),
                              ),
                            ),
                            SizedBox(height: AppConstants.height10(context),),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[200]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: MediaQuery.of(context).size.height * .02,
                                width: MediaQuery.of(context).size.width*.8,
                                decoration: BoxDecoration(
                                  color: const Color(0xffA5a5a5),
                                  borderRadius:
                                  BorderRadius.circular(AppConstants.sp10(context)),
                                ),
                              ),
                            ),
                            SizedBox(height: AppConstants.height10(context),),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[200]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: MediaQuery.of(context).size.height * .2,
                                decoration: BoxDecoration(
                                  color: const Color(0xffA5a5a5),
                                  borderRadius:
                                  BorderRadius.circular(AppConstants.sp10(context)),
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
                  );
                }
              }
            );
          }
        )
      ],
    );
  }
}
