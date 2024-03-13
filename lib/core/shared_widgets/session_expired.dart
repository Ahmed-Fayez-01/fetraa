import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fetraa/core/utils/colors/colors.dart';
import 'package:fetraa/core/utils/services/local_services/cache_helper.dart';

import '../utils/constants.dart';
import '../utils/text_styles/styles.dart';
import 'custom_button.dart';


void sessionExpiredDialog(context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(
                false);
          },
          child: AlertDialog(
            insetPadding: const EdgeInsets.all(20),
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: SizedBox(
                child: Container(
                  width: double.infinity,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppConstants.width20(context)),
                        topRight: Radius.circular(AppConstants.width20(context)),
                      )),
                  padding:
                  EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: AppConstants.height30(context),
                        ),
                        Text(
                          "session_expired".tr(),
                          style: Styles.title20(context),
                        ),
                        SizedBox(
                          height: AppConstants.height20(context),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: DefaultButton(
                                onPress: () {
                                  CacheHelper.removeData(key: "token");
                                  GoRouter.of(context).go("/loginView");
                                },
                                text: "login".tr(),
                                borderRadius: AppConstants.width10(context),
                                backgroundColor: AppColors.primaryColor,
                                height: AppConstants.height15(context),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppConstants.height20(context),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        );
      }
  );
}
