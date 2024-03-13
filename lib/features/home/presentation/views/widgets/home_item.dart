import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({super.key, required this.backColor, required this.borderColor, required this.title, required this.icon, required this.onTap});
final Color backColor;
final Color borderColor;
final String title;
final String icon;
final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height*.24,
        padding: EdgeInsets.symmetric(horizontal:AppConstants.width20(context),vertical: AppConstants.height30(context)),
        decoration: BoxDecoration(
            color: backColor,
            borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
            border: Border.all(color: borderColor)
        ),
        child: Column(
          children: [
            Image.asset(icon,width: MediaQuery.of(context).size.width*.2,height: MediaQuery.of(context).size.width*.2,),
            SizedBox(height: AppConstants.height20(context),),
            Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height*.016
            ),),
          ],
        ),
      ),
    );
  }
}
