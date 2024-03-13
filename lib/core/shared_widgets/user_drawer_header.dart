import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fetraa/core/utils/assets/assets.dart';

import '../utils/colors/colors.dart';
import '../utils/constants.dart';

class UserDrawerHeader extends StatelessWidget {
  UserDrawerHeader({super.key,required this.name,required this.imagePath,this.press});
  final String imagePath;
  final String name;
  Function()? press;
  @override
  Widget build(BuildContext context) {
    return Container(

      height: MediaQuery.of(context).size.height*.22,
      decoration:  BoxDecoration(
        gradient:LinearGradient(
            colors: [
              Colors.grey[500]!,
               Colors.grey[500]!,
            ],
            begin:  const FractionalOffset(0.0, 1.0),
            end:  const FractionalOffset(0.0, 0.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
            height: MediaQuery.of(context).size.height*.1,
            width: MediaQuery.of(context).size.height*.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.1,),
              color: Colors.white,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.1,),
                child:Center(child: Text(name[0].toUpperCase(),style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: MediaQuery.of(context).size.height * .036,
                ),)),),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * .016,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: "Poppins"),
          ),
        ],),
      ),
    );
  }
}
