import 'package:easy_localization/easy_localization.dart';
import 'package:fetraa/core/shared_widgets/custom_button.dart';
import 'package:fetraa/features/profile/presentation/view_models/get_walking_info/get_walking_info_cubit.dart';
import 'package:fetraa/features/profile/presentation/view_models/test_walking/test_walking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/shared_widgets/custom_dropdown_formfield.dart';
import '../../../../../core/shared_widgets/default_text_form_field.dart';
import '../../../../../core/utils/constants.dart';

class WalkingTimesViewBody extends StatefulWidget {
  const WalkingTimesViewBody({super.key});

  @override
  State<WalkingTimesViewBody> createState() => _WalkingTimesViewBodyState();
}

class _WalkingTimesViewBodyState extends State<WalkingTimesViewBody> {


  var formKeyWalking = GlobalKey<FormState>();
  var categoryValue;
  var categoryId;
  @override
  void initState(){
    context.read<GetWalkingInfoCubit>().getWalkingInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<GetWalkingInfoCubit,GetWalkingInfoState>(
      builder: (context,state) {
        if(state is UserGetWalkingInfoSuccessState)
          {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal:AppConstants.width20(context) ),
              child: Column(children: [
                SizedBox(height: AppConstants.height20(context),),
                Form(
                    key: formKeyWalking,
                    child: Column(children: [
                      DefaultTextFormField(
                        textInputType: TextInputType.text,
                        controller: context.read<GetWalkingInfoCubit>().fats,
                        maxLines: 1,
                        validation: (String? value) {
                          if (value!.isEmpty) {
                            return "ValidationEmptyText".tr();
                          }
                        },
                        borderRadius: MediaQuery.of(context).size.height * .01,
                        hasBorder: true,
                        hintText: "Fats".tr(),
                        borderSideEnabledColor: Colors.transparent,
                        borderSideWidth: 1,
                        readOnly: true,
                        contentPaddingHorizontal: AppConstants.width20(context),
                        contentPaddingVertical: AppConstants.height15(context),
                      ),
                      SizedBox(height: AppConstants.height20(context),),
                      CustomDropDownButton(
                        onChanged: (value) {
                          categoryValue = value;
                          for(var item in state.model.data!.category!)
                            {
                              if(item.name==categoryValue)
                                {
                                  categoryId=item.id;
                                  break;
                                }
                            }
                          print("id:$categoryId");
                        },
                        items: context.read<GetWalkingInfoCubit>().categories,
                        validator: (String? value) {
                          if (value == null) {
                            return "ValidationEmptyText".tr();
                          }
                          return null;
                        },
                        borderSideEnabledColor: const Color(0xfff2f2f2),
                        height:
                        MediaQuery.of(context).size.height * .072,
                        hintText: 'Walking Category',
                      ),
                    ],)),
                SizedBox(height: AppConstants.height20(context)*2,),
                BlocBuilder<TestWalkingCubit,TestWalkingState>(
                    builder: (context,state) {
                      return Column(
                        children: [
                          state is UserTestWalkingLoadingState ? const Center(child: CircularProgressIndicator(),) : DefaultButton(onPress: (){
                            if(formKeyWalking.currentState!.validate())
                            {
                              context.read<TestWalkingCubit>().testWalking(fats: context.read<GetWalkingInfoCubit>().fats.text, category: categoryId.toString());
                            }
                          }, text: "Calculate",borderRadius: AppConstants.sp10(context),),
                          SizedBox(height: AppConstants.height30(context)*2,),
                          state is UserTestWalkingSuccessState? Container(
                            padding: EdgeInsets.symmetric(horizontal:AppConstants.width20(context),vertical: AppConstants.height20(context)*2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
                              border: Border.all(color: const Color(0xff69BD46)),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(state.model.data!.desc!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.height*.018,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xE5000000)
                                    ),),
                                ),
                              ],
                            ),
                          ) : const SizedBox(),
                        ],
                      );
                    }
                ),
              ],),
            );
          }else{
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
      }
    );
  }
}
