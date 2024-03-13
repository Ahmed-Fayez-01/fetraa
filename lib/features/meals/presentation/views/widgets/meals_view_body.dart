import 'dart:math';

import 'package:fetraa/core/utils/colors/colors.dart';
import 'package:fetraa/features/meals/presentation/view_models/get_all_meals/get_all_meals_cubit.dart';
import 'package:fetraa/features/meals/presentation/views/meal_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/constants.dart';
import 'meal_item.dart';

class MealsViewBody extends StatelessWidget {
  const MealsViewBody({super.key});
  
  @override
  Widget build(BuildContext context) {
    List<Color> borders=[
      const Color(0xB253B175),
      const Color(0xB2F8A44C),
      const Color(0xffF7A593),
      const Color(0xffD3B0E0),
      const Color(0xffB7DFF5),
    ];
    List<Color> backgrounds=[
      const Color(0x1A53B175),
      const Color(0x1AF8A44C),
      const Color(0x40F7A593),
      const Color(0x40D3B0E0),
      const Color(0xffE6F0F5),
    ];
    Random random = Random();
    int colorIndex=0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppConstants.height20(context),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Text(
            "Recipes for Salad dishes:",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: const Color(0xff303030),
                fontSize: MediaQuery.of(context).size.height * .019),
          ),
        ),
        SizedBox(
          height: AppConstants.height20(context),
        ),
        BlocBuilder<GetAllMealsCubit, GetAllMealsState>(
            builder: (context, state) {
          if (state is UserGetAllMealsSuccessState) {
            return Expanded(
                child: RefreshIndicator(
                    color: AppColors.primaryColor,
                    onRefresh: () async {
                      context.read<GetAllMealsCubit>().getAllMeals();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal:AppConstants.width30(context) ),
                      child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: AppConstants.width20(context),
                              mainAxisSpacing: AppConstants.height20(context),
                              childAspectRatio: .8),
                          itemCount: state.model.data!.length,
                          itemBuilder: (context, index) {
                            if(index<5)
                              {
                                colorIndex=index;
                              }else{
                              colorIndex=index%5;
                            }
                          return  MealItem(
                                backColor: backgrounds[colorIndex],
                                borderColor: borders[colorIndex],
                                title: state.model.data![index].name!,
                                icon: state.model.data![index].img!,
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MealDetailsView(title: state.model.data![index].name!, id: state.model.data![index].id!.toString())));
                                });
                          } ),
                    )));
          } else {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.sp20(context)),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: AppConstants.width20(context),
                      mainAxisSpacing: AppConstants.height20(context),
                      childAspectRatio: 1),
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
        })
      ],
    );
  }
}
