import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';
import 'measure_row_info_item.dart';

class MeasurementItem extends StatelessWidget {
  const MeasurementItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Day 11/18/2024:",style: TextStyle(
              fontSize: MediaQuery.of(context).size.height*.018,
              fontWeight: FontWeight.w600,
              color: const Color(0xff212132)
          ),),
          SizedBox(height: AppConstants.height20(context),),
          const MeasureRowInfoItem(title: "Fat percentage : ", value: "5 %"),
          SizedBox(height: AppConstants.height10(context),),
          const MeasureRowInfoItem(title: "Fat weight : ", value: "10 kg"),
          SizedBox(height: AppConstants.height10(context),),
          const MeasureRowInfoItem(title: "Weight of lean mass : ", value: "10 kg"),
        ],
      ),
    );
  }
}
