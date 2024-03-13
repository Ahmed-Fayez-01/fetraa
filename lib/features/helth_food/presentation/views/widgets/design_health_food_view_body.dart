import 'package:dartz/dartz_unsafe.dart';
import 'package:fetraa/core/shared_widgets/custom_button.dart';
import 'package:fetraa/core/utils/colors/colors.dart';
import 'package:fetraa/core/utils/constants.dart';
import 'package:fetraa/features/helth_food/presentation/view_models/change_meal/change_meal_cubit.dart';
import 'package:fetraa/features/helth_food/presentation/view_models/change_meal/change_meal_state.dart';
import 'package:fetraa/features/helth_food/presentation/view_models/get_food/get_food_cubit.dart';
import 'package:fetraa/features/helth_food/presentation/view_models/get_food/get_food_state.dart';
import 'package:fetraa/features/helth_food/presentation/views/widgets/food_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class DesignHealthFoodViewBody extends StatefulWidget {
  const DesignHealthFoodViewBody({super.key, required this.numberOfMeals});
final String numberOfMeals;
  @override
  State<DesignHealthFoodViewBody> createState() => _DesignHealthFoodViewBodyState();
}

class _DesignHealthFoodViewBodyState extends State<DesignHealthFoodViewBody> {
  @override
  void initState(){
    context.read<GetFoodCubit>().getFood(numberMeals: widget.numberOfMeals);
    context.read<ChangeMealStatusCubit>().currentPage=1;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ChangeMealStatusCubit,ChangeMealStatusState>(
      builder: (context,state) {
        return BlocBuilder<GetFoodCubit,GetFoodState>(
          builder: (context,state) {
            if(state is UserGetFoodSuccessState)
              {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: AppConstants.height20(context),),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
                        child: Text("Number of Meals : ${widget.numberOfMeals}",style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height*.019,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff303030)
                        ),),
                      ),
                      SizedBox(height: AppConstants.height20(context),),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
                        child: Text("Meal Number : ${context.read<ChangeMealStatusCubit>().currentPage}",style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height*.017,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff666666)
                        ),),
                      ),
                      SizedBox(height: AppConstants.height20(context),),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: context.read<ChangeMealStatusCubit>().currentPage==1? state.model.data!.meal1!.length:context.read<ChangeMealStatusCubit>().currentPage==2?state.model.data!.meal2!.length:state.model.data!.meal3!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return FoodItem(instance: context.read<ChangeMealStatusCubit>().currentPage==1? state.model.data!.meal1![index]: context.read<ChangeMealStatusCubit>().currentPage==2?state.model.data!.meal2![index]:state.model.data!.meal3![index], pageNum: context.read<ChangeMealStatusCubit>().currentPage, general: state.model,);
                        }, separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: AppConstants.height10(context),);
                      },),
                      SizedBox(height: AppConstants.height20(context),),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
                              child: DefaultButton(onPress: (){
                                if(context.read<ChangeMealStatusCubit>().currentPage==  int.parse(widget.numberOfMeals))
                                  {
                                    for(int i=0;i<state.model.data!.meal1!.length;i++)
                                    {
                                      if(state.model.data!.meal1![i].quantity>0)
                                      {
                                        AppConstants.mealsToDesign.add({
                                          "food_id":state.model.data!.meal1![i].id,
                                          "quantity":state.model.data!.meal1![i].quantity,
                                        });
                                      }
                                    }
                                    for(int i=0;i<state.model.data!.meal2!.length;i++)
                                    {
                                      if(state.model.data!.meal2![i].quantity>0)
                                      {
                                        AppConstants.mealsToDesign.add({
                                          "food_id":state.model.data!.meal2![i].id,
                                          "quantity":state.model.data!.meal2![i].quantity,
                                        });
                                      }
                                    }
                                    if(widget.numberOfMeals == "3")
                                    {
                                      for(int i=0;i<state.model.data!.meal3!.length;i++)
                                      {
                                        if(state.model.data!.meal3![i].quantity>0)
                                        {
                                          AppConstants.mealsToDesign.add({
                                            "food_id":state.model.data!.meal3![i].id,
                                            "quantity":state.model.data!.meal3![i].quantity,
                                          });
                                        }
                                      }
                                    }

                                  }

                                context.read<ChangeMealStatusCubit>().changeMealPlus(int.parse(widget.numberOfMeals));
                              }, text: context.read<ChangeMealStatusCubit>().currentPage==  int.parse(widget.numberOfMeals)? "Receive the nutritional program" : "Next",borderRadius: AppConstants.sp10(context),),
                            ),
                          ),
                          context.read<ChangeMealStatusCubit>().currentPage==  int.parse(widget.numberOfMeals) || context.read<ChangeMealStatusCubit>().currentPage==1?
                          const SizedBox():Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
                              child: DefaultButton(onPress: (){
                                context.read<ChangeMealStatusCubit>().changeMealMinus();
                              }, text:"Previous",hasBorder: true,textColor: AppColors.primaryColor,borderRadius: AppConstants.sp10(context),backgroundColor: Colors.white,shadowColor: Colors.white,surfaceTintColor: Colors.white,elevation: 0,),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppConstants.height20(context),),
                    ],
                  ),
                );
              }else
                {
                  return Column(
                    children: [
                      SizedBox(height: AppConstants.height20(context),),
                      Expanded(
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
                      ),
                    ],
                  );
                }
          }
        );
      }
    );
  }
}
