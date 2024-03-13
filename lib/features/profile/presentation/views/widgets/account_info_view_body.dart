import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fetraa/core/shared_widgets/custom_button.dart';
import 'package:fetraa/core/utils/services/local_services/cache_helper.dart';
import 'package:fetraa/core/utils/services/local_services/cache_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/shared_widgets/default_text_form_field.dart';
import '../../../../../core/utils/assets/assets.dart';
import '../../../../../core/utils/constants.dart';

class AccountInfoViewBody extends StatefulWidget {
  const AccountInfoViewBody({super.key});

  @override
  State<AccountInfoViewBody> createState() => _AccountInfoViewBodyState();
}

class _AccountInfoViewBodyState extends State<AccountInfoViewBody> {
  TextEditingController email = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    name.text=CacheHelper.getData(key: "name");
    email.text=CacheHelper.getData(key: "email");
    password.text=CacheHelper.getData(key: "name");
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Name",
                style: TextStyle(
                  color: Color(0xff191E3A),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .008,
              ),
              DefaultTextFormField(
                textInputType: TextInputType.text,
                controller: name,
                maxLines: 1,
                readOnly: true,
                validation: (String? value) {
                  if (value!.isEmpty) {
                    return "ValidationEmptyText".tr();
                  }
                },
                borderRadius: MediaQuery.of(context).size.height * .01,
                hasBorder: true,
                fillColor: Colors.white,
                borderSideEnabledColor: const Color(0xffD8DADC),
                borderSideWidth: 1,
                contentPaddingHorizontal: AppConstants.width20(context),
                contentPaddingVertical: AppConstants.height15(context),
              ),
            ],
          ),
          SizedBox(
            height: AppConstants.height10(context),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Email",
                style: TextStyle(
                  color: Color(0xff191E3A),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .008,
              ),
              DefaultTextFormField(
                textInputType: TextInputType.emailAddress,
                controller: email,
                maxLines: 1,
                fillColor: Colors.white,
                readOnly: true,
                borderSideEnabledColor: const Color(0xffD8DADC),
                borderRadius: MediaQuery.of(context).size.height * .01,
                hasBorder: true,
                validation: (String? value) {
                  if (value!.isEmpty) {
                    return "ValidationEmptyText".tr();
                  } else if (EmailValidator.validate(value)) {
                    return null;
                  } else {
                    return "emailValidationSyntaxText".tr();
                  }
                },
                borderSideWidth: 1,
                contentPaddingHorizontal: AppConstants.width20(context),
                contentPaddingVertical: AppConstants.height15(context),
              ),
            ],
          ),
          SizedBox(
            height: AppConstants.height10(context),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Password",
                style: TextStyle(
                  color: Color(0xff191E3A),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .008,
              ),
              DefaultTextFormField(
                textInputType: TextInputType.visiblePassword,
                controller: password,
                readOnly: true,
                maxLines: 1,
                validation: (String? value) {
                  if (value!.isEmpty) {
                    return "ValidationEmptyText".tr();
                  }
                },
                borderRadius: MediaQuery.of(context).size.height * .01,
                hasBorder: true,
                isPassword: true,
                showEye: false,
                borderSideWidth: 1,
                fillColor: Colors.white,
                borderSideEnabledColor: const Color(0xffD8DADC),
                contentPaddingHorizontal: AppConstants.width20(context),
                contentPaddingVertical: AppConstants.height15(context),
              ),
            ],
          ),
          SizedBox(
            height: AppConstants.height30(context),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .06,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height * .01),
                border: Border.all(
                  color: const Color(0xffC8C8C8),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppConstants.width10(context)),
                  child: SvgPicture.asset(AssetData.google),
                ),
                Expanded(
                  child: Text(
                    "Add the official Google browsere",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.height * .02),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
