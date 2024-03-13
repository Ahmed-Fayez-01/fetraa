import 'package:fetraa/core/shared_widgets/custom_button.dart';
import 'package:fetraa/core/utils/assets/assets.dart';
import 'package:fetraa/core/utils/constants.dart';
import 'package:fetraa/features/fat_calculator/presentation/views/man_fat_calc_view.dart';
import 'package:fetraa/features/fat_calculator/presentation/views/woman_fat_calc_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FatCalculatorViewBody extends StatelessWidget {
  const FatCalculatorViewBody({super.key, required this.paid});
  final bool paid;
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AssetData.fatCalculation,width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height*.4,),
        SizedBox(height: AppConstants.height20(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width50(context)),
          child: Row(
            children: [
              Expanded(child: DefaultButton(onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ManFatCalcView(paid: paid,)));
              }, text: "Man",borderRadius: AppConstants.sp10(context),)),
              SizedBox(width: AppConstants.width50(context),),
              Expanded(child: DefaultButton(onPress: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> WomanFatCalcView(paid: paid,)));
              }, text: "Woman",borderRadius: AppConstants.sp10(context),)),
            ],
          ),
        )
      ],
    );
  }
}
