import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';

class MeasureRowInfoItem extends StatelessWidget {
  const MeasureRowInfoItem({super.key, required this.title, required this.value});
final String title;
final String value;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(AppConstants.sp20(context)),
      decoration: BoxDecoration(
          color: const Color(0xB2F1F1F1),
          borderRadius: BorderRadius.circular(AppConstants.sp10(context))
      ),
      child: Row(
        children: [
          Text(title,style: TextStyle(
              fontSize: MediaQuery.of(context).size.height*.016,
              fontWeight: FontWeight.w500,
              color: const Color(0xff595959)
          ),),
          Text(value,style: TextStyle(
              fontSize: MediaQuery.of(context).size.height*.016,
              fontWeight: FontWeight.w500,
              color: const Color(0xff1D1D1D)
          ),)
        ],
      ),
    );
  }
}
