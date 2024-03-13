import 'package:fetraa/core/shared_widgets/trainer_tabs.dart';
import 'package:fetraa/features/trainers/data/models/trainers_model.dart';
import 'package:fetraa/features/trainers/presentation/view_models/change_trainer_tabs_cubit/change_trainer_tabs_cubit.dart';
import 'package:fetraa/features/trainers/presentation/view_models/change_trainer_tabs_cubit/change_trainer_tabs_states.dart';
import 'package:fetraa/features/trainers/presentation/view_models/get_all_trainers_blog/get_all_trainers_blog_cubit.dart';
import 'package:fetraa/features/trainers/presentation/views/coach_profile_view.dart';
import 'package:fetraa/features/trainers/presentation/views/widgets/coach_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/shared_widgets/default_text_form_field.dart';
import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/constants.dart';

class TrainersViewBody extends StatefulWidget {
  const TrainersViewBody({super.key});

  @override
  State<TrainersViewBody> createState() => _TrainersViewBodyState();
}

class _TrainersViewBodyState extends State<TrainersViewBody> {
  var searchController = TextEditingController();

  @override
  void initState() {
    context.read<GetAllTrainersCubit>().getAllTrainers(subscrip: 'true');
    AppConstants.foundedTrainers = AppConstants.model;
    super.initState();
  }

  void runFilter(String enteredKeyword) {
    List<Data> result = [];
    if (enteredKeyword.isEmpty) {
      result = AppConstants.model;
    } else {
      result = AppConstants.model
          .where((product) => product.name!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      AppConstants.foundedTrainers = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppConstants.height20(context),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Row(
            children: [
              Expanded(
                child: DefaultTextFormField(
                  textInputType: TextInputType.name,
                  controller: searchController,
                  onChange: (value) {
                    runFilter(value);
                  },
                  hasBorder: false,
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
            ],
          ),
        ),
        SizedBox(
          height: AppConstants.height20(context),
        ),
        const CustomTabsTrainer(categories: ["Subscriber", "Not subscribed"]),
        SizedBox(
          height: AppConstants.height20(context),
        ),
        BlocBuilder<ChangeTrainerTabsCubit, ChangeTrainerTabsStates>(
          builder: (context, state) {
            return BlocConsumer<GetAllTrainersCubit, GetAllTrainersState>(
              builder: (context, state) {
                if (state is UserGetAllTrainersSuccessState) {
                  return Expanded(
                    child: ListView.separated(
                      itemCount: AppConstants.foundedTrainers.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CoachProfileView(
                                            id: AppConstants
                                                .foundedTrainers[index].id
                                                .toString(),
                                          )));
                            },
                            child: CoachItem(
                              instance: AppConstants.foundedTrainers[index],
                            ));
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: AppConstants.height15(context),
                        );
                      },
                    ),
                  );
                } else {
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.sp20(context)),
                      child: ListView.separated(
                        itemCount: 6,
                        itemBuilder: (context, index) => Shimmer.fromColors(
                          baseColor: Colors.grey[200]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: MediaQuery.of(context).size.height * .12,
                            decoration: BoxDecoration(
                              color: const Color(0xffA5a5a5),
                              borderRadius: BorderRadius.circular(
                                  AppConstants.sp10(context)),
                            ),
                          ),
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
              },
              listener: (BuildContext context, GetAllTrainersState state) {
                if (state is UserGetAllTrainersSuccessState) {
                  runFilter(searchController.text);
                }
              },
            );
          },
        ),
      ],
    );
  }
}
