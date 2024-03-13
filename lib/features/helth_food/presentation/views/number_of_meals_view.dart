import 'package:fetraa/features/helth_food/presentation/views/widgets/number_of_meals_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/assets/assets.dart';

class NumberOfMealsView extends StatelessWidget {
  const NumberOfMealsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        systemOverlayStyle:  const SystemUiOverlayStyle(
          statusBarColor: Color(0xff4CAD73), // <-- SEE HERE
          statusBarIconBrightness: Brightness.light, //<-- For Android SEE HERE (dark icons)
          systemNavigationBarColor: Colors.white,
          statusBarBrightness: Brightness.dark, //<-- For iOS SEE HERE (dark icons)
        ),
        title: const Text("Number of Meals",style: TextStyle(
            color: Colors.white
        ),),
        leading: InkWell(onTap: (){
          Navigator.pop(context);
        },child: SvgPicture.asset(AssetData.arrowLeft,fit: BoxFit.scaleDown,)),
        centerTitle: true,
        backgroundColor: const Color(0xff4CAD73),
      ),
      body: const NumberOfMealsViewBody(),
    );
  }
}
