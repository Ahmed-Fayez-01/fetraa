import 'package:fetraa/core/utils/constants.dart';
import 'package:fetraa/features/profile/presentation/views/widgets/Measurement_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MeasurementsViewBody extends StatelessWidget {
  const MeasurementsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: AppConstants.height20(context),),
        Expanded(
          child: ListView.separated(itemBuilder: (BuildContext context, int index) {
            return  const MeasurementItem();
          }, separatorBuilder: (BuildContext context, int index) { 
            return SizedBox(height: AppConstants.height20(context)*2,);
          }, itemCount: 2,),
        ),
       
      ],
    );
  }
}
