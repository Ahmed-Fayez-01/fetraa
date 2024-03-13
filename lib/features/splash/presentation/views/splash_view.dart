import 'package:fetraa/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/colors/colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
//fayez
    return  Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            elevation: 0,
            systemOverlayStyle:  SystemUiOverlayStyle(
              statusBarColor: const Color(0xff53B97C), // <-- SEE HERE
              statusBarIconBrightness: Brightness.light, //<-- For Android SEE HERE (dark icons)
              systemNavigationBarColor: AppColors.primaryColor,
              statusBarBrightness: Brightness.dark, //<-- For iOS SEE HERE (dark icons)
            ),
          )
      ),
      body: const SplashViewBody(),
    );
  }
}
