import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';

class FatCalcRowItem extends StatelessWidget {
  const FatCalcRowItem({super.key, required this.title, required this.value});
final String title;
final String value;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: AppConstants.width20(context)),
      child: Row(
        children: [
          Expanded(child: Text(title,style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.height*.016,
              color: const Color(0xff666666)
          ),)),
          Text(value,style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.height*.016,
              color: const Color(0xff666666)
          ),),
        ],
      ),
    );
  }
}
