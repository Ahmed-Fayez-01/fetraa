import 'package:fetraa/features/trainers/presentation/view_models/change_trainer_tabs_cubit/change_trainer_tabs_cubit.dart';
import 'package:fetraa/features/trainers/presentation/view_models/change_trainer_tabs_cubit/change_trainer_tabs_states.dart';
import 'package:fetraa/features/trainers/presentation/view_models/get_all_trainers_blog/get_all_trainers_blog_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/colors/colors.dart';
import '../utils/constants.dart';
import '../utils/text_styles/styles.dart';

class CustomTabsTrainer extends StatelessWidget {
  const CustomTabsTrainer({super.key, required this.categories});

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeTrainerTabsCubit, ChangeTrainerTabsStates>(
        builder: (context, state) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * .05,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<ChangeTrainerTabsCubit>().changeTabs(0);
                        context.read<GetAllTrainersCubit>().getAllTrainers(subscrip: "true");
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            categories[0],
                            style: Styles.title12(context).copyWith(
                              color:
                                  context.read<ChangeTrainerTabsCubit>().selectedTab ==
                                          0
                                      ? AppColors.primaryColor
                                      : Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          context.read<ChangeTrainerTabsCubit>().selectedTab == 0
                              ? Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadiusDirectional.vertical(
                                          top: Radius.circular(
                                              AppConstants.sp30(context)))),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width * .18,
                                    height: MediaQuery.of(context).size.width * .015,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<ChangeTrainerTabsCubit>().changeTabs(1);
                        context.read<GetAllTrainersCubit>().getAllTrainers(subscrip: "");
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            categories[1],
                            style: Styles.title12(context).copyWith(
                              color:
                                  context.read<ChangeTrainerTabsCubit>().selectedTab ==
                                          1
                                      ? AppColors.primaryColor
                                      : Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          context.read<ChangeTrainerTabsCubit>().selectedTab == 1
                              ? Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadiusDirectional.vertical(
                                          top: Radius.circular(
                                              AppConstants.sp30(context)))),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width * .18,
                                    height: MediaQuery.of(context).size.width * .015,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 0,
            ),
          ],
        ),
      );
    });
  }
}
