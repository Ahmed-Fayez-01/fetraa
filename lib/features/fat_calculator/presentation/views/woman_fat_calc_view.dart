import 'package:fetraa/features/fat_calculator/presentation/views/widgets/woman_fat_calc_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/assets/assets.dart';

class WomanFatCalcView extends StatelessWidget {
  const WomanFatCalcView({super.key, required this.paid});
final bool paid;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        systemOverlayStyle:  const SystemUiOverlayStyle(
          statusBarColor: Color(0xff4CAD73), // <-- SEE HERE
          statusBarIconBrightness: Brightness.light, //<-- For Android SEE HERE (dark icons)
          systemNavigationBarColor: Colors.white,
          statusBarBrightness: Brightness.dark, //<-- For iOS SEE HERE (dark icons)
        ),
        title: const Text("Fat Calculation",style: TextStyle(
            color: Colors.white
        ),),
        leading: InkWell(onTap: (){
          Navigator.pop(context);
        },child: SvgPicture.asset(AssetData.arrowLeft,fit: BoxFit.scaleDown,)),
        centerTitle: true,
        backgroundColor: const Color(0xff4CAD73),
      ),
      body: WomanFatCalcViewBody(paid: paid,),
    );
  }
}
