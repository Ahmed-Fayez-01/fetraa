import 'package:fetraa/features/profile/presentation/view_models/change_subscription_cubit/change_subscription_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/constants.dart';

class SubscriptionItem extends StatelessWidget {
  const SubscriptionItem({super.key, required this.index});
final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:AppConstants.width20(context)),
      child: Container(
        padding: EdgeInsets.all(AppConstants.sp20(context)),
        decoration: BoxDecoration(
          color:context.read<ChangeSubscriptionCubit>().selectedSubscription==index? const Color(0xffF6FFF9):const Color(0xffF5F5F5),
          borderRadius: BorderRadius.circular(AppConstants.sp10(context)),
          border:  Border.all(color:context.read<ChangeSubscriptionCubit>().selectedSubscription==index? AppColors.primaryColor:Colors.transparent)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("3 Month Offer",style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height*.018,
                      fontWeight: FontWeight.w600
                  ),),
                  SizedBox(height: AppConstants.height5(context),),
                  Text("30 days free, then 999 EGP/year",style: TextStyle(
                      color: const Color(0xff4F4F4F),
                      fontSize: MediaQuery.of(context).size.height*.014,
                      fontWeight: FontWeight.w600
                  ),),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal:AppConstants.width20(context),vertical: AppConstants.height5(context)),
              decoration: BoxDecoration(
                  color: context.read<ChangeSubscriptionCubit>().selectedSubscription==index? AppColors.primaryColor:Colors.transparent,
                  borderRadius: BorderRadius.circular(AppConstants.sp20(context))
              ),
              child: Text("Limited Time",style: TextStyle(
                  color:  Colors.white,
                  fontSize: MediaQuery.of(context).size.height*.014,
                  fontWeight: FontWeight.w600
              ),),
            )
          ],
        ),
      ),
    );
  }
}
