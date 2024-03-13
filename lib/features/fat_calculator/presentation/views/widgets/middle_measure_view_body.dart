import 'package:fetraa/core/shared_widgets/custom_button.dart';
import 'package:fetraa/core/utils/assets/assets.dart';
import 'package:fetraa/core/utils/constants.dart';
import 'package:fetraa/features/fat_calculator/presentation/views/lower_back_measure_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MiddleMeasureViewBody extends StatelessWidget {
  const MiddleMeasureViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppConstants.height30(context)*2,),
        Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AssetData.videoBanner,width: MediaQuery.of(context).size.width-AppConstants.width20(context)*2,fit: BoxFit.fill,),
                ],
              ),
            ),
            CircleAvatar(
              radius: MediaQuery.of(context).size.height*.03,
              backgroundColor: const Color(0xff84C245),
              child: SvgPicture.asset(AssetData.arrowRight,width: MediaQuery.of(context).size.height*.01,),
            )
          ],
        ),
        SizedBox(height: AppConstants.height30(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Text("How to take correct measurements of the middle of the body",style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: MediaQuery.of(context).size.height*.022,
              color: const Color(0xff303030)
          ),),
        ),
        SizedBox(height: AppConstants.height10(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(AppConstants.width5(context)),
                decoration: BoxDecoration(
                  color: const Color(0xff8D5EF2),
                  borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
                ),
                child: Text("The Health",style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height*.014,
                    fontWeight: FontWeight.w600
                ),),
              ),
              SizedBox(width: AppConstants.width5(context),),
              Container(
                padding: EdgeInsets.all(AppConstants.width5(context)),
                decoration: BoxDecoration(
                  color: const Color(0xff0082CD),
                  borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
                ),
                child: Text("Thinness",style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height*.014,
                    fontWeight: FontWeight.w600
                ),),
              ),
              SizedBox(width: AppConstants.width5(context),),
              Container(
                padding: EdgeInsets.all(AppConstants.width5(context)),
                decoration: BoxDecoration(
                  color: const Color(0xff4DC9D1),
                  borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
                ),
                child: Text("Sports",style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height*.014,
                    fontWeight: FontWeight.w600
                ),),
              ),
            ],
          ),
        ) ,
        SizedBox(height: AppConstants.height20(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Text("If you are interested in getting your health system now, just join us If you are interested in getting your health system now, just join us now",style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.height*.018,
              color: const Color(0xff9D9FA0)
          ),),
        ),
        SizedBox(height: AppConstants.height30(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Text("The correct way to take measurements:",style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: MediaQuery.of(context).size.height*.022,
              color: const Color(0xff303030)
          ),),
        ),
        SizedBox(height: AppConstants.height20(context),),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: Text("The smallest size is taken for the medium",style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.height*.016,
              color: const Color(0xff666666)
          ),),
        ),
        SizedBox(height: AppConstants.height30(context)*2,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
          child: DefaultButton(onPress: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const LowerBackMeasureView()));
          }, text: "Next",borderRadius: AppConstants.sp10(context),),
        ),
      ],
    );
  }
}
