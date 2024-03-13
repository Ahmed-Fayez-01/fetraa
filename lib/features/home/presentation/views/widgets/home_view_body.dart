import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fetraa/features/blogs/presentation/views/blogs_view.dart';
import 'package:fetraa/features/fat_calculator/presentation/views/fat_calculator_view.dart';
import 'package:fetraa/features/home/presentation/view_models/slider_cubit/get_slider_cubit.dart';
import 'package:fetraa/features/home/presentation/views/widgets/home_item.dart';
import 'package:fetraa/features/main_layout/view_model/change_nav_bar_status/change_nav_bar_status_cubit.dart';
import 'package:fetraa/features/videos/presentation/views/video_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/shared_widgets/default_text_form_field.dart';
import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../meals/presentation/views/meals_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final TextEditingController searchController = TextEditingController();
  var currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Transform.translate(
              offset: Offset(0,-MediaQuery.of(context).size.height * .05),
              child: Container(
                height: MediaQuery.of(context).size.height * .37,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AssetData.homeBack),
                      fit: BoxFit.cover
                  ),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: AppConstants.height20(context),),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.width20(context)),
                  child: Row(
                    children: [
                      Expanded(
                        child: DefaultTextFormField(
                          textInputType: TextInputType.name,
                          controller: searchController,
                          onChange: (value) {
                          },
                          contentPaddingVertical:
                          MediaQuery.of(context).size.height * .015,
                          borderSideColor: AppColors.primaryColor,
                          borderSideEnabledColor: AppColors.primaryColor,
                          prefixIcon: SvgPicture.asset(
                            AssetData.search,
                            fit: BoxFit.scaleDown,
                          ),
                          hintText: "Search",
                        ),
                      ),
                      SizedBox(width: AppConstants.width20(context),),
                      SvgPicture.asset(AssetData.notification),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.05,),
                BlocBuilder<GetSliderCubit,GetSliderState>(
                  builder: (context,state) {
                   if(state is UserGetSliderSuccessState)
                     {
                       return Padding(
                         padding: EdgeInsets.symmetric(horizontal:AppConstants.width30(context)),
                         child: Container(
                           decoration: BoxDecoration(
                               borderRadius:
                               BorderRadius.circular(AppConstants.sp10(context)),
                               color: Colors.white,
                               boxShadow: const [
                                 BoxShadow(
                                   color: Colors.black12,
                                   blurRadius: 6,
                                   spreadRadius: 2,
                                 )
                               ]),
                           child: state.model.data!.isNotEmpty
                               ? CarouselSlider.builder(
                             options: CarouselOptions(
                               autoPlay: true,
                               aspectRatio: 1.8,
                               viewportFraction: 1,
                               onPageChanged: (index, reason) {
                                 setState(() {
                                   currentIndex = index;
                                 });
                               },
                             ),
                             itemCount: state.model.data!.length,
                             itemBuilder: (BuildContext context, int index,
                                 int realIndex) {
                               return ClipRRect(
                                 borderRadius: BorderRadius.circular(
                                     AppConstants.width10(context)),
                                 child: CachedNetworkImage(
                                   placeholder: (context, url) =>
                                       Shimmer.fromColors(
                                         baseColor: Colors.grey[400]!,
                                         highlightColor: Colors.grey[200]!,
                                         child: Container(
                                           decoration: BoxDecoration(
                                             color: Colors.grey,
                                             borderRadius:
                                             BorderRadius.circular(20),
                                           ),
                                         ),
                                       ),
                                   errorWidget: (context, url, error) =>
                                   const Icon(Icons.error),
                                   imageUrl:state.model.data!.isNotEmpty
                                       ? state.model.data![index].image!
                                       : "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png",
                                   fit: BoxFit.fill,
                                   width: MediaQuery.of(context).size.width,
                                 ),
                               );
                             },
                           )
                               : ClipRRect(
                             borderRadius: BorderRadius.circular(
                                 AppConstants.width10(context)),
                             child: CachedNetworkImage(
                               placeholder: (context, url) =>
                                   Shimmer.fromColors(
                                     baseColor: Colors.grey[400]!,
                                     highlightColor: Colors.grey[200]!,
                                     child: Container(
                                       decoration: BoxDecoration(
                                         color: Colors.grey,
                                         borderRadius: BorderRadius.circular(20),
                                       ),
                                     ),
                                   ),
                               errorWidget: (context, url, error) =>
                               const Icon(Icons.error),
                               imageUrl:
                               "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png",
                               fit: BoxFit.fill,
                               height: MediaQuery.of(context).size.height*.22,
                               width: MediaQuery.of(context).size.width,
                             ),
                           ),
                         ),
                       );
                     }else{
                     return  Shimmer.fromColors(
                       baseColor: Colors.grey[200]!,
                       highlightColor: Colors.grey[100]!,
                       child: Padding(
                         padding: EdgeInsets.symmetric(horizontal:AppConstants.width30(context) ),
                         child: Container(
                           height: MediaQuery.of(context).size.height*.22,
                           width: MediaQuery.of(context).size.width,
                           decoration: BoxDecoration(
                             color: Colors.grey,
                             borderRadius:
                             BorderRadius.circular(20),
                           ),
                         ),
                       ),
                     );
                   }
                  }
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              SizedBox(height: AppConstants.height10(context),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppConstants.width30(context)),
                child:  Row(
                  children: [
                    Expanded(child: HomeItem(backColor: const Color(0x1AF8A44C), borderColor:  const Color(0xB2F8A44C), title: 'Fat calculation', icon: AssetData.calc, onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const FatCalculatorView(paid: false,)));
                    },)),
                    SizedBox(width: AppConstants.width20(context),),
                    Expanded(child: HomeItem(backColor: const Color(0x1A53B175), borderColor:  const Color(0xB253B175), title: 'Blogs', icon: AssetData.papers, onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const BlogsView()));
                    },)),
                  ],
                ),
              ),
              SizedBox(height: AppConstants.height20(context),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppConstants.width30(context)),
                child:  Row(
                  children: [
                    Expanded(child: HomeItem(backColor: const Color(0x40F7A593), borderColor:  const Color(0xffF7A593), title: 'video clips', icon: AssetData.creator, onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const VideoView()));
                    },)),
                    SizedBox(width: AppConstants.width20(context),),
                    Expanded(child: HomeItem(backColor: const Color(0x40D3B0E0), borderColor:  const Color(0xffD3B0E0), title: 'Trainers', icon: AssetData.trainers, onTap: () {
                      context.read<ChangeNavBarStatusCubit>().changeNavBarIndex(2);
                    },)),
                  ],
                ),
              ),
              SizedBox(height: AppConstants.height20(context),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppConstants.width30(context)),
                child:  Row(
                  children: [
                    Expanded(child: HomeItem(backColor: const Color(0xffE6F0F5), borderColor:  const Color(0xffB7DFF5), title: 'Paid Fat calculation', icon: AssetData.calc2, onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const FatCalculatorView(paid: true,)));
                    },)),
                    SizedBox(width: AppConstants.width20(context),),
                    Expanded(child: HomeItem(backColor: const Color(0x1AF8A44C), borderColor:  const Color(0xB2F8A44C), title: 'Recipes', icon: AssetData.meals, onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const MealsView()));
                    },)),
                  ],
                ),
              ),
              SizedBox(height: AppConstants.height20(context),),
            ],
          ),
        )
      ],
    );
  }
}
