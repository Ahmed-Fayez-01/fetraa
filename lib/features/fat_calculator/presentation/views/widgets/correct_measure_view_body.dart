import 'package:fetraa/core/shared_widgets/custom_button.dart';
import 'package:fetraa/core/utils/constants.dart';
import 'package:fetraa/features/fat_calculator/presentation/views/lower_back_measure_view.dart';
import 'package:fetraa/features/fat_calculator/presentation/views/neck_measure_view.dart';
import 'package:flutter/material.dart';

import '../middle_measure_view.dart';

class CorrectMeasureViewBody extends StatelessWidget {
  const CorrectMeasureViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: DefaultButton(
            onPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const NeckMeasureView()));
            },
            text: "Neck",
            backgroundColor: const Color(0x40F7A593),
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            hasBorder: false,
            textColor: const Color(0xff4F4F4F),
            borderRadius: AppConstants.sp20(context),
          ),
        ),
        SizedBox(height: AppConstants.height30(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: DefaultButton(
            onPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const MiddleMeasureView()));
            },
            text: "Middle",
            backgroundColor: const Color(0x1AF8A44C),
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            hasBorder: false,
            textColor: const Color(0xff4F4F4F),
            borderRadius: AppConstants.sp20(context),
          ),
        ),
        SizedBox(height: AppConstants.height30(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: DefaultButton(
            onPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const LowerBackMeasureView()));
            },
            text: "Lower Back",
            backgroundColor: const Color(0x1A53B175),
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            hasBorder: false,
            textColor: const Color(0xff4F4F4F),
            borderRadius: AppConstants.sp20(context),
          ),
        ),
      ],
    );
  }
}
