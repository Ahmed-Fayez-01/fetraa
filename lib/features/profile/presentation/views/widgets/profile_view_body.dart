import 'package:dio/dio.dart';
import 'package:fetraa/core/shared_widgets/custom_button.dart';
import 'package:fetraa/core/utils/services/local_services/cache_helper.dart';
import 'package:fetraa/features/profile/presentation/view_models/upload_image_profile/upload_image_profile_cubit.dart';
import 'package:fetraa/features/profile/presentation/views/account_info_view.dart';
import 'package:fetraa/features/profile/presentation/views/measurements_view.dart';
import 'package:fetraa/features/profile/presentation/views/sleeping_schedules_view.dart';
import 'package:fetraa/features/profile/presentation/views/subscription_view.dart';
import 'package:fetraa/features/profile/presentation/views/walking_times_view.dart';
import 'package:fetraa/features/profile/presentation/views/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/constants.dart';
import '../../view_models/update_image/update_image_cubit.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: AppConstants.height20(context),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:AppConstants.width20(context) ),
            child: Row(
              children: [
                InkWell(onTap: (){
                  Navigator.pop(context);
                },child: SvgPicture.asset(AssetData.arrowLeft,color: Colors.black,)),
              ],
            ),
          ),
          SizedBox(height: AppConstants.height20(context),),
          BlocConsumer<UploadImageProfileCubit,
              UploadImageProfileState>(
            builder: (context, state) {
              return Container(
                padding:
                EdgeInsets.all(AppConstants.width5(context)),
                height: MediaQuery.of(context).size.height * .13,
                width: MediaQuery.of(context).size.height * .13,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height * .13,
                  ),
                  color: Colors.transparent,
                ),
                child: BlocBuilder<UpdateImageCubit,UpdateImageState>(
                  builder: (context,state) {
                   if(state is UserUpdateImageLoadingState)
                     {
                       return const Center(child: CircularProgressIndicator(),);
                     }else{
                     return GestureDetector(
                         onTap: () {
                           context.read<UploadImageProfileCubit>()
                               .selectProfileImage();
                         },
                         child: context.read<UploadImageProfileCubit>().profileImage != null
                             ? Stack(
                           alignment: Alignment.center,
                           children: [
                             SizedBox(
                                 height:
                                 MediaQuery.of(context).size.height *
                                     .12,
                                 width:
                                 MediaQuery.of(context).size.height *
                                     .12,
                                 child: ClipRRect(
                                   borderRadius: BorderRadius.circular(
                                     MediaQuery.of(context).size.height *
                                         .12,
                                   ),
                                   child: ColorFiltered(
                                     colorFilter: const ColorFilter.mode(
                                         Colors.black12, BlendMode.darken),
                                     child: Image.file(
                                       context.read<UploadImageProfileCubit>().profileImage!,
                                       fit: BoxFit.cover,
                                     ),
                                   ),
                                 )),
                             Positioned(
                               child: ClipRRect(
                                 borderRadius: BorderRadius.circular(
                                   MediaQuery.of(context).size.height *
                                       .12,
                                 ),
                                 child: SvgPicture.asset(
                                   "assets/images/user_upload_image.svg",
                                   fit: BoxFit.scaleDown,
                                 ),
                               ),
                             ),
                           ],
                         )
                             : Stack(
                           alignment: Alignment.center,
                           children: [
                             SizedBox(
                                 height:
                                 MediaQuery.of(context).size.height *
                                     .12,
                                 width:
                                 MediaQuery.of(context).size.height *
                                     .12,
                                 child: ClipRRect(
                                   borderRadius: BorderRadius.circular(
                                     MediaQuery.of(context).size.height *
                                         .12,
                                   ),
                                   child: ColorFiltered(
                                     colorFilter: const ColorFilter.mode(
                                         Colors.black12, BlendMode.darken),
                                     child:CacheHelper.getData(key: "img") !=null ? Image.network(
                                       CacheHelper.getData(key: "img"),
                                       fit: BoxFit.cover,
                                     ):Image.asset("assets/images/no_user.jpeg"),
                                   ),
                                 )),
                             Positioned(
                               child: ClipRRect(
                                 borderRadius: BorderRadius.circular(
                                   MediaQuery.of(context).size.height *
                                       .12,
                                 ),
                                 child: SvgPicture.asset(
                                   "assets/images/user_upload_image.svg",
                                   fit: BoxFit.scaleDown,
                                 ),
                               ),
                             ),
                           ],
                         )
                     );

                   }
                  }
                ),
              );
            },
            listener: (BuildContext context, state) async {
              if (state is SelectProfileImageSuccessState) {
                 AppConstants.file = state.image;
                String fileName = AppConstants.file!.path.split("/").last;
                MultipartFile image = await MultipartFile.fromFile(
                  AppConstants.file!.path,
                  filename: fileName,
                );
                print("uuuuuu:${image}");
                context.read<UpdateImageCubit>().updateImageUser(image:image,);
              }
            },
          ),
          SizedBox(height: AppConstants.height10(context),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(CacheHelper.getData(key: "name"),style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff4F4F4F),
                  fontSize: MediaQuery.of(context).size.height*.024
              ),),
            ],
          ),
          SizedBox(height: AppConstants.height30(context),),
          ProfileItem(title: 'Account Information', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const AccountInfoView()));
          },),
          SizedBox(height: AppConstants.height10(context),),
          ProfileItem(title: 'Sleeping schedules', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const SleepingSchedulesView()));
          },),
          SizedBox(height: AppConstants.height10(context),),
          ProfileItem(title: 'Walking times', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const WalkingTimesView()));
          },),
          SizedBox(height: AppConstants.height10(context),),
          ProfileItem(title: 'Subscriptions', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const SubscriptionView()));
          },),
          SizedBox(height: AppConstants.height10(context),),
          ProfileItem(title: 'My Measurements', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const MeasurementsView()));
          },),
          SizedBox(height: AppConstants.height30(context)*2,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
            child: DefaultButton(onPress: (){}, text: "Sign Out",textColor: const Color(0xff212132),icon: SvgPicture.asset(AssetData.signOut),borderRadius: AppConstants.sp20(context),backgroundColor: const Color(0xffF2F3F2),surfaceTintColor: Colors.transparent,shadowColor: Colors.transparent,),
          ),
        ],
      ),
    );
  }
}
