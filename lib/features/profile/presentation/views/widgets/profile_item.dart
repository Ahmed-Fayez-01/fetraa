import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/constants.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.title, required this.onTap});
final String title;
final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: BorderDirectional(start: BorderSide(color: AppColors.primaryColor,width: AppConstants.width5(context)),),
              borderRadius: BorderRadius.circular(AppConstants.width5(context)),
              boxShadow: const [
                BoxShadow(
                    color: Color(0x140B4A57),
                    spreadRadius: 0,
                    blurRadius: 12
                )
              ]
          ),
          child: Row(children: [
            Expanded(child: Padding(
              padding:  EdgeInsets.all(AppConstants.sp20(context)),
              child: Text(title,style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: MediaQuery.of(context).size.height*.018,
                color: const Color(0xff585858)
              ),),
            )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.width10(context)),
              child: SvgPicture.asset(AssetData.arrowRight,color: Colors.black,),
            ),
          ],),
        ),
      ),
    );
  }
}
