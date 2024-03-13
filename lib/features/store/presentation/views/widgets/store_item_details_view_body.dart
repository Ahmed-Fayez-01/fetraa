import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetraa/core/shared_widgets/custom_button.dart';
import 'package:fetraa/core/utils/colors/colors.dart';
import 'package:fetraa/features/store/presentation/view_models/get_product_details/get_product_details_cubit.dart';
import 'package:fetraa/features/store/presentation/views/widgets/similar_product_item.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../../../../../core/utils/constants.dart';

class StoreItemDetailsViewBody extends StatefulWidget {
  const StoreItemDetailsViewBody({super.key, required this.id});

  final String id;

  @override
  State<StoreItemDetailsViewBody> createState() =>
      _StoreItemDetailsViewBodyState();
}

class _StoreItemDetailsViewBodyState extends State<StoreItemDetailsViewBody> {
  int currentIndex = 0;

  @override
  void initState() {
    context.read<GetProductDetailsCubit>().getProductDetails(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductDetailsCubit, GetProductDetailsState>(
        builder: (context, state) {
      if (state is UserGetProductDetailsSuccessState) {
        return Stack(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 1.2,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                  itemCount: state.model.data!.images!.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return CachedNetworkImage(
                      placeholder: (context, url) => Shimmer.fromColors(
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
                      imageUrl: state.model.data!.images![index].path!,
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                    );
                  },
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * .08,
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: currentIndex,
                    decorator: DotsDecorator(
                        color: const Color(0xff828282),
                        spacing: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * .005),
                        activeColor: const Color(0xffffffff),
                        size: Size(MediaQuery.of(context).size.height * .009,
                            MediaQuery.of(context).size.height * .009)),
                  ),
                ),
              ],
            ),
            Transform.translate(
              offset: Offset(0, MediaQuery.of(context).size.height * .32),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(AppConstants.sp30(context)))),
                child: ListView(
                  children: [
                    SizedBox(
                      height: AppConstants.height20(context),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.width20(context)),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppConstants.width10(context),
                                vertical:
                                    MediaQuery.of(context).size.height * .002),
                            decoration: BoxDecoration(
                                color: const Color(0x334CAD73),
                                borderRadius: BorderRadius.circular(
                                    AppConstants.width5(context))),
                            child: Text(
                              state.model.data!.category!,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * .014,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppConstants.height10(context),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.width20(context)),
                      child: Text(
                        state.model.data!.name!,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: MediaQuery.of(context).size.height * .016,
                            color: const Color(0xff333333)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.width20(context)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price per kilo : ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize:
                                    MediaQuery.of(context).size.height * .015,
                                color: Color(0xff828282)),
                          ),
                          Text(
                            state.model.data!.price!,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize:
                                    MediaQuery.of(context).size.height * .015,
                                color: AppColors.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.width20(context)),
                      child: Text(
                        "14,000",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: const Color(0xffBDBDBD),
                            fontSize: MediaQuery.of(context).size.height * .015,
                            color: const Color(0xffBDBDBD)),
                      ),
                    ),
                    SizedBox(
                      height: AppConstants.height10(context),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppConstants.width20(context)),
                          child: Text(
                            "Description",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize:
                                    MediaQuery.of(context).size.height * .018,
                                color: AppColors.primaryColor),
                          ),
                        ),
                        SizedBox(
                          height: AppConstants.height10(context),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppConstants.width20(context)),
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadiusDirectional.vertical(
                                    top: Radius.circular(
                                        AppConstants.sp30(context)))),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * .2,
                              height: MediaQuery.of(context).size.width * .01,
                            ),
                          ),
                        ),
                        const Divider(
                          color: Color(0xffBDBDBD),
                          height: 0,
                          thickness: .5,
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppConstants.height10(context),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.width20(context)),
                      child: Text(
                        state.model.data!.desc!,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff828282),
                            fontSize:
                                MediaQuery.of(context).size.height * .014),
                      ),
                    ),
                    SizedBox(
                      height: AppConstants.height20(context),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.width20(context)),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppConstants.width20(context),
                            vertical: AppConstants.height10(context)),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius:
                              BorderRadius.circular(AppConstants.sp20(context)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    state.model.data!.fat!.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .016,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Fats",
                                    style: TextStyle(
                                      color: const Color(0xffEAEAEF),
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .016,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    state.model.data!.carb!.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .016,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Carb",
                                    style: TextStyle(
                                      color: const Color(0xffEAEAEF),
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .016,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    state.model.data!.proten!.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .016,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Protein",
                                    style: TextStyle(
                                      color: const Color(0xffEAEAEF),
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .016,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    state.model.data!.qty!.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .016,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Gram",
                                    style: TextStyle(
                                      color: const Color(0xffEAEAEF),
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .016,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    state.model.data!.calories!.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .016,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Calories",
                                    style: TextStyle(
                                      color: const Color(0xffEAEAEF),
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .016,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppConstants.height10(context),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.width20(context)),
                      child: Text(
                        "Similar Products",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: MediaQuery.of(context).size.height * .016,
                            color: const Color(0xff333333)),
                      ),
                    ),
                    SizedBox(
                      height: AppConstants.height10(context),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .12,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppConstants.width20(context)),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.model.data!.product!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SimilarProduct(instance: state.model.data!.product![index],);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: AppConstants.width10(context),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppConstants.height10(context),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.width20(context)),
                      child: DefaultButton(
                        onPress: () {},
                        text: "Go shopping",
                        borderRadius: AppConstants.sp10(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      } else {
        return Column(
          children: [
            SizedBox(height: AppConstants.height20(context)*3,),
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
            ),
          ],
        );
      }
    });
  }
}
