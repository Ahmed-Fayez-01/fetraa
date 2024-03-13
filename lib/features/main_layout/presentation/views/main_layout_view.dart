
import 'package:fetraa/core/utils/services/local_services/cache_keys.dart';
import 'package:fetraa/features/home/presentation/views/home_view.dart';
import 'package:fetraa/features/main_layout/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:fetraa/features/main_layout/view_model/change_nav_bar_status/change_nav_bar_status_cubit.dart';
import 'package:fetraa/features/profile/presentation/views/profile_view.dart';
import 'package:fetraa/features/store/presentation/views/store_view.dart';
import 'package:fetraa/features/trainers/presentation/views/trainers_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_widgets/exit_alert.dart';

class MainLayoutView extends StatelessWidget {
  MainLayoutView({super.key});

  List<Widget> screens = [
    const HomeView(),
    const StoreView(),
    const TrainersView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    var cubit = ChangeNavBarStatusCubit.get(context);
    print(CacheKeysManger.tokenStatus());
    return WillPopScope(
      onWillPop: () async {
        exitDialog(context);
        return true;
      },
      child: BlocBuilder<ChangeNavBarStatusCubit, ChangeNavBarStatusState>(builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(0.0), // here the desired height
              child: AppBar(
                elevation: 0,
                systemOverlayStyle:   SystemUiOverlayStyle(
                  statusBarColor: cubit.currentIndex==0 ? const Color(0xff4CAD73):Colors.white, // <-- SEE HERE
                  statusBarIconBrightness:cubit.currentIndex==0?Brightness.light:Brightness.dark, //<-- For Android SEE HERE (dark icons)
                  systemNavigationBarColor: Colors.white,
                  statusBarBrightness:cubit.currentIndex==0? Brightness.dark:Brightness.light, //<-- For iOS SEE HERE (dark icons)
                ),
              )
          ),
          body: Column(
            children: [
              Expanded(child: screens[cubit.currentIndex]),
              const BottomNavBar(),
            ],
          ),

        );
      }),
    );
    // bottomNavigationBar: const ,
  }
}
