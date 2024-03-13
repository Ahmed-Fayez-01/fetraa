import 'package:easy_localization/easy_localization.dart';
import 'package:fetraa/core/utils/assets/assets.dart';
import 'package:fetraa/core/utils/constants.dart';
import 'package:fetraa/features/main_layout/presentation/views/widgets/bottom_nav_bar_item.dart';
import 'package:fetraa/features/main_layout/view_model/change_nav_bar_status/change_nav_bar_status_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> icons = [
      AssetData.home,
      AssetData.cart,
      AssetData.users,
      AssetData.profile,
    ];
    return Container(
      decoration:  BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 20,
            spreadRadius: 0,
          )
        ],
        borderRadius: BorderRadius.vertical(top: Radius.circular(MediaQuery.of(context).size.height*.05)),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: AppConstants.width15(context), vertical: AppConstants.height5(context)),
      child: BlocBuilder<ChangeNavBarStatusCubit, ChangeNavBarStatusState>(builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            4,
            (index) => BottomNavBarItem(
              icon: icons[index],
              index: index,
            ),
          ),
        );
      }),
    );
  }
}
