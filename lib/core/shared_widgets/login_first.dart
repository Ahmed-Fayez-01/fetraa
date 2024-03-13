import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fetraa/core/utils/constants.dart';
import 'package:fetraa/features/auth/presentation/views/login_view.dart';
import '../utils/colors/colors.dart';
import 'custom_button.dart';

Future defaultLogin({
  required BuildContext context,
}) =>
    showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text("login".tr(), textAlign: TextAlign.center,
              ),
              content: Text(
                "login_msg".tr(),
              ),
              actions: [

                Row(
                  children: [
                    Expanded(
                      child: DefaultButton(onPress: () {
                       GoRouter.of(context).go("/loginView");
                      },
                        text: "login".tr(),
                        backgroundColor: AppColors.primaryColor,
                        borderRadius: AppConstants.sp10(context),
                        fontSize: MediaQuery.of(context).size.height*.016,
                      ),
                    ),
                    SizedBox(width: AppConstants.width20(context),),
                    Expanded(child: DefaultButton(onPress: () {
                      Navigator.pop(context);
                    },
                      text: "cancel".tr(),
                      backgroundColor: Colors.grey.shade300,
                      textColor: AppColors.primaryColor,
                      borderRadius: AppConstants.sp10(context),
                      fontSize: MediaQuery.of(context).size.height*.016,
                    )),
                  ],
                ),
              ],
            ));
