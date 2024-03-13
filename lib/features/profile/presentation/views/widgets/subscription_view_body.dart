import 'package:fetraa/core/shared_widgets/custom_button.dart';
import 'package:fetraa/core/shared_widgets/custom_tabs_item.dart';
import 'package:fetraa/core/utils/assets/assets.dart';
import 'package:fetraa/core/utils/colors/colors.dart';
import 'package:fetraa/core/utils/constants.dart';
import 'package:fetraa/features/profile/presentation/view_models/change_subscription_cubit/change_subscription_cubit.dart';
import 'package:fetraa/features/profile/presentation/view_models/change_subscription_cubit/change_subscription_states.dart';
import 'package:fetraa/features/profile/presentation/views/widgets/subscription_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionViewBody extends StatelessWidget {
  const SubscriptionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AssetData.giftCard,width: MediaQuery.of(context).size.width*.5,),
            ],
          ),
          SizedBox(height: AppConstants.height20(context),),
          // const CustomTabsItem(categories: ["Groups","Private","Calculator"]),
          SizedBox(height: AppConstants.height20(context)*2,),
          BlocBuilder<ChangeSubscriptionCubit,ChangeSubscriptionStates>(
            builder: (context,state) {
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                return  InkWell(onTap: (){
                  context.read<ChangeSubscriptionCubit>().changeSubscription(index);
                },child: SubscriptionItem(index: index,));
              }, separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: AppConstants.height20(context),);
              },);
            }
          ),
          SizedBox(height: AppConstants.height30(context)*2,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
            child: DefaultButton(onPress: (){}, text: "Get started 30-days free",borderRadius: AppConstants.sp10(context),),
          ),
          SizedBox(height: AppConstants.height20(context),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
            child:Text("Once you subscribe, you agree to the terms and conditions of privacy. The subscription is automatically renewed after the end of the subscription period unless you cancel the subscription.",
              textAlign: TextAlign.center,
              style: TextStyle(
              color: const Color(0xff888888),
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.height*.014
            ),)
          ),
          SizedBox(height: AppConstants.height20(context),),
        ],
      ),
    );
  }
}
