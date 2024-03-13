import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetraa/core/shared_widgets/custom_button.dart';
import 'package:fetraa/core/utils/assets/assets.dart';
import 'package:fetraa/features/trainers/presentation/view_models/get_all_trainers_blog/get_all_trainers_blog_cubit.dart';
import 'package:fetraa/features/trainers/presentation/view_models/get_trainer_details/get_product_details_cubit.dart';
import 'package:fetraa/features/trainers/presentation/view_models/subscribe_trainer/subscribe_trainer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/shared_widgets/success_subscribed_alert.dart';
import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/constants.dart';

class CoachProfileViewBody extends StatefulWidget {
  const CoachProfileViewBody({super.key, required this.id});

  final String id;

  @override
  State<CoachProfileViewBody> createState() => _CoachProfileViewBodyState();
}

class _CoachProfileViewBodyState extends State<CoachProfileViewBody> {
  @override
  void initState() {
    context.read<GetTrainerDetailsCubit>().getTrainerDetails(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTrainerDetailsCubit, GetTrainerDetailsState>(
        builder: (context, state) {
      if (state is UserGetTrainerDetailsSuccessState) {
        return Column(
          children: [
            SizedBox(
              height: AppConstants.height20(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.width20(context)),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        AssetData.arrowLeft,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: AppConstants.height20(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(AppConstants.width5(context)),
                  height: MediaQuery.of(context).size.height * .13,
                  width: MediaQuery.of(context).size.height * .13,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height * .13,
                    ),
                    color: Colors.transparent,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height * .13,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: state.model.data![0].img!,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * .1,
                      placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppConstants.height10(context),
            ),
            Text(
              "Coach : ${state.model.data![0].name!}",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.height * .018),
            ),
            SizedBox(
              height: AppConstants.height5(context),
            ),
            Text(
              state.model.data![0].subscrip! ? "Subscribed" : "Not Subscribed",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: state.model.data![0].subscrip!
                      ? AppColors.primaryColor
                      : const Color(0xff888888),
                  fontSize: MediaQuery.of(context).size.height * .014),
            ),
            SizedBox(
              height: AppConstants.height20(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.width20(context)),
              child: Row(
                children: [
                  Text(
                    "About him :",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.of(context).size.height * .016),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppConstants.height5(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.width20(context)),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      state.model.data![0].bio ?? "There is no Bio",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff4F4F4F),
                          fontSize: MediaQuery.of(context).size.height * .014),
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
              child: Row(
                children: [
                  Text(
                    "Phone Number :",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.of(context).size.height * .016),
                  ),
                  SizedBox(
                    width: AppConstants.width5(context),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetData.phone,
                        width: MediaQuery.of(context).size.width * .035,
                      ),
                      SizedBox(
                        width: AppConstants.width5(context),
                      ),
                      Text(state.model.data![0].phone!,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize:
                                  MediaQuery.of(context).size.height * .014,
                              color: const Color(0xff4F4F4F))),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: AppConstants.height20(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.width20(context)),
              child: Row(
                children: [
                  Text(
                    "Some Work :",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.of(context).size.height * .016),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppConstants.height20(context),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.width20(context)),
                child: state.model.data![0].works!.isNotEmpty
                    ? GridView.count(
                        crossAxisCount: state.model.data![0].works!.length,
                        crossAxisSpacing: AppConstants.width10(context),
                        mainAxisSpacing: AppConstants.height10(context),
                        children: List.generate(state.model.data![0].works!.length, (index) {
                          return Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  AppConstants.sp10(context)),
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
                                imageUrl:state.model.data![0].works![index].img!,
                                fit: BoxFit.fill,
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: MediaQuery.of(context).size.width * 0.3,
                              ),
                            ),
                          );
                        }))
                    : const SizedBox(),
              ),
            ),
            state.model.data![0].subscrip!
                ? const SizedBox()
                : BlocConsumer<SubscribeTrainerCubit, SubscribeTrainerState>(
                    builder: (context, state) {
                      return state is UserSubscribeTrainerLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppConstants.width20(context)),
                              child: DefaultButton(
                                onPress: () {
                                  context
                                      .read<SubscribeTrainerCubit>()
                                      .subscribeTrainer(id: widget.id);
                                },
                                text: "Subscribe Now",
                                borderRadius: AppConstants.sp10(context),
                              ),
                            );
                    },
                    listener:
                        (BuildContext context, SubscribeTrainerState state) {
                      if (state is UserSubscribeTrainerSuccessState) {
                        successDialog(context);
                        context
                            .read<GetTrainerDetailsCubit>()
                            .getTrainerDetails(id: widget.id);
                        context.read<GetAllTrainersCubit>().getAllTrainers(subscrip: '');
                        context.read<GetAllTrainersCubit>().getAllTrainers(subscrip: 'true');
                      } else if (state is UserSubscribeTrainerErrorState) {}
                    },
                  ),
            state.model.data![0].subscrip!
                ? const SizedBox()
                : SizedBox(
                    height: AppConstants.height20(context),
                  ),
          ],
        );
      } else {
        return Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: AppConstants.height30(context) * 2),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[200]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .12,
                      width: MediaQuery.of(context).size.height * .12,
                      decoration: const BoxDecoration(
                        color: Color(0xffA5a5a5),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppConstants.height10(context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[200]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: MediaQuery.of(context).size.height * .015,
                          width: MediaQuery.of(context).size.width * .6,
                          decoration: BoxDecoration(
                            color: const Color(0xffA5a5a5),
                            borderRadius:
                                BorderRadius.circular(AppConstants.sp10(context)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppConstants.height10(context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[200]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: MediaQuery.of(context).size.height * .015,
                          width: MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                            color: const Color(0xffA5a5a5),
                            borderRadius:
                                BorderRadius.circular(AppConstants.sp10(context)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppConstants.height30(context),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[200]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: MediaQuery.of(context).size.height * .015,
                              width: MediaQuery.of(context).size.width * .6,
                              decoration: BoxDecoration(
                                color: const Color(0xffA5a5a5),
                                borderRadius: BorderRadius.circular(
                                    AppConstants.sp10(context)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppConstants.height10(context),
                      ),
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[200]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: MediaQuery.of(context).size.height * .015,
                              width: MediaQuery.of(context).size.width * .4,
                              decoration: BoxDecoration(
                                color: const Color(0xffA5a5a5),
                                borderRadius: BorderRadius.circular(
                                    AppConstants.sp10(context)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppConstants.height20(context),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[200]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: MediaQuery.of(context).size.height * .015,
                              width: MediaQuery.of(context).size.width * .6,
                              decoration: BoxDecoration(
                                color: const Color(0xffA5a5a5),
                                borderRadius: BorderRadius.circular(
                                    AppConstants.sp10(context)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppConstants.height10(context),
                      ),
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[200]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: MediaQuery.of(context).size.height * .015,
                              width: MediaQuery.of(context).size.width * .4,
                              decoration: BoxDecoration(
                                color: const Color(0xffA5a5a5),
                                borderRadius: BorderRadius.circular(
                                    AppConstants.sp10(context)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppConstants.height20(context),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[200]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: MediaQuery.of(context).size.height * .015,
                              width: MediaQuery.of(context).size.width * .6,
                              decoration: BoxDecoration(
                                color: const Color(0xffA5a5a5),
                                borderRadius: BorderRadius.circular(
                                    AppConstants.sp10(context)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppConstants.height10(context),
                      ),
                      Row(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[200]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: MediaQuery.of(context).size.height * .015,
                              width: MediaQuery.of(context).size.width * .4,
                              decoration: BoxDecoration(
                                color: const Color(0xffA5a5a5),
                                borderRadius: BorderRadius.circular(
                                    AppConstants.sp10(context)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppConstants.height30(context),
                  ),

                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.sp20(context)),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: AppConstants.width10(context),
                      mainAxisSpacing: AppConstants.height10(context),
                      childAspectRatio: 1),
                  itemCount: 12,
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
            ),
          ],
        );
      }
    });
  }
}
