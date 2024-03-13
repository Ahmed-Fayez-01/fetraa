import 'package:cached_network_image/cached_network_image.dart';
import 'package:fetraa/features/trainers/data/models/trainers_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/constants.dart';

class CoachItem extends StatelessWidget {
  const CoachItem({super.key, required this.instance});
  final Data instance;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
      child: Container(
        padding: EdgeInsets.all(AppConstants.sp10(context)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
            border: Border.all(color: const Color(0xff888888))
        ),
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .08,
              width: MediaQuery.of(context).size.height * .08,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.height * .08,
                ),
                color: Colors.transparent,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.height * .08,
                ),
                child: CachedNetworkImage(
                  imageUrl: instance.img!,
                  fit: BoxFit.cover,
                  height:
                  MediaQuery.of(context).size.height * .08,
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(width: AppConstants.width10(context),),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Coach : ${instance.name!}",style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.height*.014
                  ),),
                  SizedBox(height: AppConstants.height5(context),),
                  Row(
                    children: [
                      SvgPicture.asset(AssetData.phone,width: MediaQuery.of(context).size.width*.035,),
                      SizedBox(width: AppConstants.width5(context),),
                      Text(instance.phone!,style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height*.012,
                          color: const Color(0xff4F4F4F)
                      )),
                    ],
                  )
                ],
              ),
            ),
            Text(instance.subscrip! ?"Subscribed": "Subscribe Now!",style: TextStyle(
                fontSize: MediaQuery.of(context).size.height*.012,
                fontWeight: FontWeight.w500,
                color:instance.subscrip! ?AppColors.primaryColor: const Color(0xff888888)
            ),),
          ],
        ),
      ),
    );
  }
}
