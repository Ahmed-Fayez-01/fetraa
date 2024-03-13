import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/assets/assets.dart';
import '../utils/colors/colors.dart';
import '../utils/constants.dart';
import '../utils/text_styles/styles.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    required this.hintText,
    required this.onChanged,
    required this.items,
    super.key,
    required this.validator,
  this.onTap,
  this.value,
  this.height,
  this.hasBorder=true,
    this.borderRadius = 10,
  this.borderSideColor,
  this.iconDropColor,
  this.fillColor,
  this.borderSideEnabledColor,
    this.borderSideWidth = 1.0,  this.enabledBorderRadiusColor = Colors.grey,
    this.prefixIcon,
  });

  final List<String>? items;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final String hintText;
  final double? height;
  final double borderRadius;
  final double borderSideWidth;
  final Color enabledBorderRadiusColor;
  final Color? borderSideColor;
  final Color? fillColor;
  final Color? iconDropColor;
  final Color? borderSideEnabledColor;
  final bool hasBorder;
  final Widget? prefixIcon;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      buttonHeight:height?? AppConstants.height30(context),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        isDense: true,
        fillColor: fillColor??const Color(0xffF2F2F2),
        filled: true,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              borderRadius,
            ),
          ),
          borderSide: (!hasBorder)
              ? BorderSide.none
              : BorderSide(
            color: borderSideColor?? AppColors.primaryColor,
            width: borderSideWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              borderRadius,
            ),
          ),
          borderSide: (!hasBorder)
              ? BorderSide.none
              : BorderSide(
            color: borderSideColor?? AppColors.primaryColor,
            width: borderSideWidth,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              borderRadius,
            ),
          ),
          borderSide: (!hasBorder)
              ? BorderSide.none
              : BorderSide(
            color: borderSideEnabledColor?? Colors.grey.shade300,
            width: borderSideWidth,
          ),
        ),
      ),
      value: value,
      isExpanded: true,
      hint: Text(
        hintText,
        style: Styles.hintText(context),
      ),
      items: items!
          .map((item) => DropdownMenuItem<String>(
                onTap: onTap,
                value: item.toString(),
                child: Text(
                  item.toString(),
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height*.016,
                  ),
                ),
              ))
          .toList(),
      validator: validator,
      icon: SvgPicture.asset(AssetData.dropDown,color: iconDropColor,),
      buttonPadding: EdgeInsets.only(right: AppConstants.width10(context)),
      onChanged: onChanged,
    );
  }
}
