import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fetraa/core/shared_widgets/custom_button.dart';
import 'package:fetraa/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/assets/assets.dart';

void successDialog(context) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AssetData.congratulation, width: MediaQuery
                .of(context)
                .size
                .width * .4,),
            SizedBox(height: AppConstants.height10(context),),
            Text(
              "Successfully Subscribed".tr(),
            ),
            SizedBox(height: AppConstants.height20(context),),
            DefaultButton(onPress: (){
              Navigator.pop(context);
            }, text: "Okay",borderRadius: AppConstants.sp10(context),),
          ],
        ),
      ));
}
