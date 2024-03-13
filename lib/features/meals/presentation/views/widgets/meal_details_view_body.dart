import 'package:fetraa/features/meals/presentation/view_models/get_meal_by_id/get_meal_by_id_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/constants.dart';

class MealDetailsViewBody extends StatefulWidget {
  const MealDetailsViewBody({super.key, required this.id});
final String id;
  @override
  State<MealDetailsViewBody> createState() => _MealDetailsViewBodyState();
}

class _MealDetailsViewBodyState extends State<MealDetailsViewBody> {
  @override
  void initState(){
    context.read<GetMealByIdCubit>().getMealById(id: widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMealByIdCubit,GetMealByIdState>(
      builder: (context,state) {
        if(state is UserGetMealByIdSuccessState)
          {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppConstants.height20(context),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
                  child: Text("The Components :",style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff303030),
                      fontSize: MediaQuery.of(context).size.height*.019
                  ),),
                ),
                SizedBox(height: AppConstants.height10(context),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
                  child: Text(state.model.data!.components!,style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff666666),
                      fontSize: MediaQuery.of(context).size.height*.017
                  ),),
                ),
                SizedBox(height: AppConstants.height20(context),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
                  child: Text("How to prepare : ",style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff303030),
                      fontSize: MediaQuery.of(context).size.height*.019
                  ),),
                ),
                SizedBox(height: AppConstants.height10(context),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
                  child: Text(state.model.data!.recipe!,style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff666666),
                      fontSize: MediaQuery.of(context).size.height*.017
                  ),),
                ),
              ],
            );
          }else{
          return Column(
            children: [
              SizedBox(height: AppConstants.height20(context),),
              Expanded(
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
              ),
            ],
          );
        }

      }
    );
  }
}
