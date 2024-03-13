import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';
import '../correct_measure_view.dart';

class CorrectMesureItem extends StatelessWidget {
  const CorrectMesureItem({super.key, required this.onTap});
final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConstants.width5(context)),
      decoration: const BoxDecoration(
          color: Color(0xffFFE082)
      ),
      child:  Stack(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const CorrectMeasureView()));
              },
              child: Text("Go to the correct way to take measurements",style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height*.016,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff585858)
              ),),
            ),
          ],
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:AppConstants.width10(context) ),
            child: Icon(Icons.close,color: const Color(0xff585858),size: MediaQuery.of(context).size.height*.025,),
          ),
        ),
      ],),
    );
  }
}
