import 'package:flutter/material.dart';

abstract class Styles{
  static TextStyle bottomNavBarTitle(context)=> TextStyle(
      fontSize: MediaQuery.of(context).size.height*.014,
      fontWeight: FontWeight.w600,
      fontFamily: "Cairo");
  static TextStyle title12(context)=> TextStyle(
      fontSize: MediaQuery.of(context).size.height*.016,
      fontWeight: FontWeight.w400,
      fontFamily: "Cairo");
  static TextStyle onboardingBigTitleText(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height*.045,
    fontWeight: FontWeight.w700,
    color: const Color(0xffF2F2F2),
    fontFamily: "Cairo",
  );
  static TextStyle splashTitle(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height*.04,
    fontWeight: FontWeight.w700,
    fontFamily: "Cairo",
  );
  static TextStyle onboardingTitleText(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height*.018,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: "Cairo",
  );
  static TextStyle onBoardingDescriptionText(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height*.018,
    fontWeight: FontWeight.w600,
    color: const Color(0xff747688),
    fontFamily: "Cairo",
  );
  static TextStyle descriptionGrey(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height*.016,
    fontWeight: FontWeight.w400,
    color: const Color(0xff828282),
    fontFamily: "Cairo",
  );
  static TextStyle hintText(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height*.013,
    fontWeight: FontWeight.w400,
    color: const Color(0xff595959),
    fontFamily: "Cairo",
  );

  static TextStyle title20(context)=> TextStyle(
      fontSize: MediaQuery.of(context).size.height*.024,
      fontWeight: FontWeight.w600,
      fontFamily: "Cairo");
  static TextStyle title18(context)=> TextStyle(
      fontSize: MediaQuery.of(context).size.height*.022,
      fontWeight: FontWeight.w600,
      fontFamily: "Cairo");
  static TextStyle title16(context)=> TextStyle(
      fontSize: MediaQuery.of(context).size.height*.02,
      fontWeight: FontWeight.w500,
      fontFamily: "Cairo");
  static TextStyle title14(context)=> TextStyle(
      fontSize: MediaQuery.of(context).size.height*.018,
      fontWeight: FontWeight.w600,
      fontFamily: "Cairo");
}