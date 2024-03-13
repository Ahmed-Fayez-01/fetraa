import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fetraa/features/main_layout/presentation/views/main_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/shared_widgets/custom_button.dart';
import '../../../../core/shared_widgets/custom_dropdown_formfield.dart';
import '../../../../core/shared_widgets/default_text_form_field.dart';
import '../../../../core/shared_widgets/toast.dart';
import '../../../../core/utils/assets/assets.dart';
import '../../../../core/utils/constants.dart';
import '../view_model/register_cubit/register_cubit.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController email = TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController age = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController confirmPassword = TextEditingController();
  var formKeyRegister = GlobalKey<FormState>();
  var genderValue;
  List<String> genders = ["Male", "Female"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Color(0xff53B97C),
              // <-- SEE HERE
              statusBarIconBrightness: Brightness.light,
              //<-- For Android SEE HERE (dark icons)
              systemNavigationBarColor: Colors.white,
              statusBarBrightness:
                  Brightness.dark, //<-- For iOS SEE HERE (dark icons)
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Transform.translate(
                  offset: Offset(0, -MediaQuery.of(context).size.height * .1),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .5,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AssetData.authBack),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.width20(context)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: AppConstants.height10(context),
                      ),
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                AssetData.arrowLeft,
                                color: Colors.white,
                                width:
                                    MediaQuery.of(context).size.height * .035,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: Offset(-AppConstants.width20(context),
                      MediaQuery.of(context).size.height * .08),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset(
                            AssetData.authIcon,
                            fit: BoxFit.contain,
                            width: MediaQuery.of(context).size.height * .35,
                            height: MediaQuery.of(context).size.height * .35,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.width * .35,
                  right: MediaQuery.of(context).size.width * .25,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * .022,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Cairo",
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Transform.translate(
              offset: Offset(0, -MediaQuery.of(context).size.height * .08),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.width20(context)),
                child: Column(
                  children: [
                    Form(
                      key: formKeyRegister,
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
                                height:
                                    MediaQuery.of(context).size.height * .008,
                              ),
                              DefaultTextFormField(
                                textInputType: TextInputType.text,
                                controller: name,
                                maxLines: 1,
                                validation: (String? value) {
                                  if (value!.isEmpty) {
                                    return "ValidationEmptyText".tr();
                                  }
                                },
                                borderRadius:
                                    MediaQuery.of(context).size.height * .01,
                                hasBorder: true,
                                borderSideWidth: 0,
                                contentPaddingHorizontal:
                                    AppConstants.width20(context),
                                contentPaddingVertical:
                                    AppConstants.height15(context),
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
                                height:
                                    MediaQuery.of(context).size.height * .008,
                              ),
                              DefaultTextFormField(
                                textInputType: TextInputType.emailAddress,
                                controller: email,
                                maxLines: 1,
                                borderRadius:
                                    MediaQuery.of(context).size.height * .01,
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
                                borderSideWidth: 0,
                                contentPaddingHorizontal:
                                    AppConstants.width20(context),
                                contentPaddingVertical:
                                    AppConstants.height15(context),
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
                                "Phone",
                                style: TextStyle(
                                  color: Color(0xff191E3A),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .008,
                              ),
                              DefaultTextFormField(
                                textInputType: TextInputType.number,
                                controller: phone,
                                maxLines: 1,
                                borderRadius:
                                    MediaQuery.of(context).size.height * .01,
                                hasBorder: true,
                                validation: (String? value) {
                                  if (value!.isEmpty) {
                                    return "ValidationEmptyText".tr();
                                  }
                                },
                                borderSideWidth: 0,
                                contentPaddingHorizontal:
                                    AppConstants.width20(context),
                                contentPaddingVertical:
                                    AppConstants.height15(context),
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
                                "Age",
                                style: TextStyle(
                                  color: Color(0xff191E3A),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .008,
                              ),
                              DefaultTextFormField(
                                textInputType: TextInputType.number,
                                controller: age,
                                maxLines: 1,
                                borderRadius:
                                    MediaQuery.of(context).size.height * .01,
                                hasBorder: true,
                                validation: (String? value) {
                                  if (value!.isEmpty) {
                                    return "ValidationEmptyText".tr();
                                  }
                                },
                                borderSideWidth: 0,
                                contentPaddingHorizontal:
                                    AppConstants.width20(context),
                                contentPaddingVertical:
                                    AppConstants.height15(context),
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
                                "Type",
                                style: TextStyle(
                                  color: Color(0xff191E3A),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .008,
                              ),
                              CustomDropDownButton(
                                onChanged: (value) {
                                  genderValue = value;
                                },
                                items: genders,
                                validator: (String? value) {
                                  if (value == null) {
                                    return "ValidationEmptyText".tr();
                                  }
                                  return null;
                                },
                                borderSideEnabledColor: const Color(0xfff2f2f2),
                                height:
                                    MediaQuery.of(context).size.height * .072,
                                hintText: 'gender',
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
                                height:
                                    MediaQuery.of(context).size.height * .008,
                              ),
                              DefaultTextFormField(
                                textInputType: TextInputType.visiblePassword,
                                controller: password,
                                maxLines: 1,
                                validation: (String? value) {
                                  if (value!.isEmpty) {
                                    return "ValidationEmptyText".tr();
                                  }
                                },
                                borderRadius:
                                    MediaQuery.of(context).size.height * .01,
                                hasBorder: true,
                                isPassword: true,
                                borderSideWidth: 0,
                                contentPaddingHorizontal:
                                    AppConstants.width20(context),
                                contentPaddingVertical:
                                    AppConstants.height15(context),
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
                                "Confirm Password",
                                style: TextStyle(
                                  color: Color(0xff191E3A),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .008,
                              ),
                              DefaultTextFormField(
                                textInputType: TextInputType.text,
                                controller: confirmPassword,
                                isPassword: true,
                                maxLines: 1,
                                validation: (String? value) {
                                  if (value!.isEmpty) {
                                    return "ValidationEmptyText".tr();
                                  } else if (confirmPassword.text !=
                                      password.text) {
                                    return "notIdenticalText".tr();
                                  }
                                },
                                borderRadius:
                                    MediaQuery.of(context).size.height * .01,
                                hasBorder: true,
                                borderSideWidth: 0,
                                contentPaddingHorizontal:
                                    AppConstants.width20(context),
                                contentPaddingVertical:
                                    AppConstants.height15(context),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppConstants.height30(context),
                          ),
                          BlocConsumer<RegisterCubit, RegisterState>(
                            builder: (BuildContext context, state) {
                              return state is UserRegisterLoadingState
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : DefaultButton(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .018,
                                      onPress: () {
                                        if (formKeyRegister.currentState!
                                            .validate()) {
                                          context
                                              .read<RegisterCubit>()
                                              .registerUser(
                                                  name: name.text,
                                                  email: email.text,
                                                  password: password.text,
                                                  phone: phone.text,
                                                  type: genderValue.toString(),
                                                  age: age.text,
                                                  accountType: "email");
                                        }
                                      },
                                      text: 'signup'.tr(),
                                      borderRadius:
                                          MediaQuery.of(context).size.height *
                                              .01,
                                    );
                            },
                            listener: (BuildContext context, state) async {
                              if (state is UserRegisterSuccessState) {
                                // var snackBar = SnackBar(content: Text(state.model.message!));
                                // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                toast(text: state.model.message!, color: Colors.green);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>MainLayoutView()));
                              } else if (state is UserRegisterErrorState) {
                                toast(text: state.errMessage!, color: Colors.red);
                              } else if (state is UserRegisterLoadingState) {}
                            },
                          ),
                          SizedBox(
                            height: AppConstants.height15(context),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .014,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Cairo",
                                    color: const Color(0xff0EB177)),
                              ),
                              InkWell(
                                onTap: () {
                                  GoRouter.of(context).push("/loginView");
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .014,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Cairo",
                                      color: const Color(0xff0EB177)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
