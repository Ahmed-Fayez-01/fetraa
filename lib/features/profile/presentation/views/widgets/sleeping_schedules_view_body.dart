import 'package:easy_localization/easy_localization.dart';
import 'package:fetraa/core/shared_widgets/custom_button.dart';
import 'package:fetraa/features/profile/presentation/view_models/test_sleeping/test_sleeping_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/shared_widgets/default_text_form_field.dart';
import '../../../../../core/utils/constants.dart';

class SleepingSchedulesViewBody extends StatefulWidget {
  const SleepingSchedulesViewBody({super.key});

  @override
  State<SleepingSchedulesViewBody> createState() => _SleepingSchedulesViewBodyState();
}

class _SleepingSchedulesViewBodyState extends State<SleepingSchedulesViewBody> {
  TextEditingController to = TextEditingController();

  TextEditingController from = TextEditingController();
  var formKeySleeping = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal:AppConstants.width20(context) ),
      child: Column(children: [
        SizedBox(height: AppConstants.height20(context),),
        Form(
            key: formKeySleeping,
            child: Column(children: [
          DefaultTextFormField(
            textInputType: TextInputType.number,
            controller: from,
            maxLines: 1,
            validation: (String? value) {
              if (value!.isEmpty) {
                return "ValidationEmptyText".tr();
              }
            },
            onTap: () async {
              await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now()
              )
                  .then((value) {
                setState(() {
                  from.text ="${value!.hour}:${value!.minute}";
                });
              });
            },
            readOnly: true,
            borderRadius: MediaQuery.of(context).size.height * .01,
            hasBorder: true,
            hintText: "from".tr(),
            borderSideEnabledColor: Colors.transparent,
            borderSideWidth: 1,
            contentPaddingHorizontal: AppConstants.width20(context),
            contentPaddingVertical: AppConstants.height15(context),
          ),
          SizedBox(height: AppConstants.height20(context),),
          DefaultTextFormField(
            textInputType: TextInputType.number,
            controller: to,
            maxLines: 1,
            readOnly: true,
            onTap: () async {
              await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now()
              )
                  .then((value) {
                setState(() {
                  to.text ="${value!.hour}:${value.minute}".replaceAll(" ", "");
                });
              });
            },
            validation: (String? value) {
              if (value!.isEmpty) {
                return "ValidationEmptyText".tr();
              }
            },
            borderRadius: MediaQuery.of(context).size.height * .01,
            hasBorder: true,
            hintText: "to".tr(),
            borderSideEnabledColor: Colors.transparent,
            borderSideWidth: 1,
            contentPaddingHorizontal: AppConstants.width20(context),
            contentPaddingVertical: AppConstants.height15(context),
          ),
        ],)),
        SizedBox(height: AppConstants.height20(context)*2,),
        BlocBuilder<TestSleepingCubit,TestSleepingState>(
          builder: (context,state) {
            return Column(
              children: [
                state is UserTestSleepingLoadingState ? const Center(child: CircularProgressIndicator(),) : DefaultButton(onPress: (){
                  if(formKeySleeping.currentState!.validate())
                    {
                      context.read<TestSleepingCubit>().testSleeping(from: from.text, to: to.text);
                    }
                }, text: "Calculate",borderRadius: AppConstants.sp10(context),),
                SizedBox(height: AppConstants.height30(context)*2,),
               state is UserTestSleepingSuccessState? Container(
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
  }
}
