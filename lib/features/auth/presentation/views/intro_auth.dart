
import 'package:easy_localization/easy_localization.dart';
import 'package:fetraa/core/utils/colors/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fetraa/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/shared_widgets/custom_button.dart';
import '../../../../core/utils/assets/assets.dart';
import '../../../../core/utils/text_styles/styles.dart';

class IntroAuthView extends StatelessWidget {
  const IntroAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            elevation: 0,
            systemOverlayStyle:  const SystemUiOverlayStyle(
              statusBarColor: Color(0xff53B97C),
              // <-- SEE HERE
              statusBarIconBrightness: Brightness.light,
              //<-- For Android SEE HERE (dark icons)
              systemNavigationBarColor:Colors.white,
              statusBarBrightness:
              Brightness.dark, //<-- For iOS SEE HERE (dark icons)
            ),
          )),
      body: Stack(

        children: [
          Column(
            children: [
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Transform.translate(
                            offset: Offset(0,-MediaQuery.of(context).size.height * .1),
                            child: Container(
                              height: MediaQuery.of(context).size.height * .5,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(AssetData.authBack),
                                    fit: BoxFit.cover
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(height: AppConstants.height20(context),),
                              Row(
                                children: [
                                  Image.asset(
                                    AssetData.introAuthIcon,
                                    fit: BoxFit.contain,
                                    width:
                                    MediaQuery.of(context).size.height *
                                        .4,
                                    height:
                                    MediaQuery.of(context).size.height *
                                        .45,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppConstants.width20(context)),
                        child: Column(
                          children: [
                            DefaultButton(
                              height:
                              MediaQuery.of(context).size.height *
                                  .018,
                              onPress: () {
                                GoRouter.of(context).push("/loginView");
                              },
                              text: 'signin'.tr(),
                              fontFamily: "Cairo",
                              fontSize:
                              MediaQuery.of(context).size.height *
                                  .02,
                              borderRadius:
                              MediaQuery.of(context).size.height *
                                  .01,
                            ),
                            SizedBox(height: AppConstants.height20(context),),
                            DefaultButton(
                              height:
                              MediaQuery.of(context).size.height *
                                  .018,
                              onPress: () {
                                print("value!.email");
                                GoRouter.of(context).push("/registerView");
                              },
                              text: 'signup'.tr(),
                              backgroundColor: Colors.white,
                              textColor: AppColors.primaryColor,
                              shadowColor: Colors.white,
                              surfaceTintColor: Colors.white,
                              elevation: 0,
                              fontFamily: "Cairo",
                              fontSize:
                              MediaQuery.of(context).size.height *
                                  .02,
                              hasBorder: true,

                              borderRadius:
                              MediaQuery.of(context).size.height *
                                  .01,
                            ),
                            SizedBox(
                              height: AppConstants.height30(context),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: MediaQuery.of(context).size.height*.002,
                                      decoration: const BoxDecoration(
                                        color: Color(0xff828282),
                                      ),),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: AppConstants.width5(context)),
                                    child: Text(
                                      "or".tr(),
                                      style: Styles.descriptionGrey(context)
                                          .copyWith(
                                          color: const Color(0xff333333),
                                          fontSize: MediaQuery.of(context)
                                              .size
                                              .height *
                                              .014,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Cairo"
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: MediaQuery.of(context).size.height*.002,
                                      decoration: const BoxDecoration(
                                        color: Color(0xff828282),
                                      ),),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: AppConstants.height30(context),
                            ),
                            InkWell(
                              onTap: ()async{
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height *
                                    .06,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*.01),
                                    border: Border.all(
                                      color: const Color(0xffBDBDBD),
                                    )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(start: AppConstants.width20(context)),
                                      child: SvgPicture.asset(AssetData.google),
                                    ),
                                    Expanded(
                                      child: Text("Continue with Google",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "Cairo",

                                          fontWeight: FontWeight.w500,
                                          fontSize: MediaQuery.of(context).size.height*.02
                                      ),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
