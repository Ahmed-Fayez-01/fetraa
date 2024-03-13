import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/colors/colors.dart';
import '../utils/constants.dart';

class DefaultButton extends StatelessWidget {
  void Function()? onPress;
  String text;
  Widget? icon;
  double? borderRadius;
  double? height;
  double? fontSize;
  String? fontFamily;
  Color? backgroundColor;
  Color? textColor;
  Color? surfaceTintColor;
  Color? shadowColor;
  bool hasBorder;
  double? elevation;

  DefaultButton({
    Key? key,
    required this.onPress,
    required this.text,
    this.icon,
    this.borderRadius,
    this.height,
    this.fontFamily,
    this.fontSize,
    this.backgroundColor,
    this.textColor,
    this.hasBorder = false,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          surfaceTintColor:surfaceTintColor,
          shadowColor: shadowColor,
          elevation: elevation?? 3,
          padding: EdgeInsets.symmetric(vertical: height ?? AppConstants.height20(context)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 0,
            ),
            side: BorderSide(color: hasBorder ? AppColors.primaryColor:Colors.transparent)
          )),
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize ?? MediaQuery.of(context).size.height*.018,
                    fontFamily: fontFamily??"Cairo")),
          ),
          SizedBox(width: AppConstants.width5(context),),
          if (icon != null) ...[

            icon!,
            const SizedBox(
              width: 30,
            ),
          ],
        ],
      ),
    );
  }
}
