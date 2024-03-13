import 'package:go_router/go_router.dart';
import 'package:fetraa/core/utils/assets/assets.dart';
import 'package:fetraa/core/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../../../core/shared_widgets/custom_button.dart';
import '../../../../../core/utils/colors/colors.dart';
import '../../../../../core/utils/services/local_services/cache_keys.dart';
import '../../../../../core/utils/text_styles/styles.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Transform.translate(
                offset: Offset(0, -MediaQuery.of(context).size.height * .1),
                child: Container(
                  height: MediaQuery.of(context).size.height * .56,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AssetData.authBack),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.height * .5,
                      height: MediaQuery.of(context).size.height * .5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset(AssetData.onBoarding),
                        ],
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .04,
                  ),
                  Text(
                    "Get on an intermittent fasting diet",
                    style: Styles.onboardingTitleText(context),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .08,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.width20(context)),
                    child: DefaultButton(
                      onPress: () {
                        if(CacheKeysManger.tokenStatus() != ""|| CacheKeysManger.tokenStatus() != null)
                          {
                            GoRouter.of(context).go("/mainLayoutView");
                          }else
                            {
                              GoRouter.of(context).go("/introAuthView");
                            }
                      },
                      text: 'ابدأ',
                      borderRadius: AppConstants.sp10(context),
                      backgroundColor: Colors.white,
                      textColor: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .08,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .04,
        ),
      ],
    );
  }
}
