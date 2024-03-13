import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:fetraa/features/profile/data/models/update_image_model.dart';
import 'package:fetraa/features/profile/data/models/walking_info_model.dart';
import 'package:fetraa/features/profile/data/repos/profile_repo.dart';
import 'package:flutter/cupertino.dart';


part 'get_walking_info_state.dart';

class GetWalkingInfoCubit extends Cubit<GetWalkingInfoState> {
  GetWalkingInfoCubit(this.profileRepo) : super(GetWalkingInfoInitial());
  ProfileRepo? profileRepo;
  List<String> categories=[];
  List<int> categoriesIds=[];
  TextEditingController fats = TextEditingController();
  Future<void> getWalkingInfo() async {
    emit(UserGetWalkingInfoLoadingState());
    var result = await profileRepo!.getWalkingInfo();
    return result.fold((failure) {
      emit(UserGetWalkingInfoErrorState(failure.errMessage));
    }, (data) {
      categories.clear();
      categoriesIds.clear();
      fats.text=data.data!.fat!.bodyFat!;
      for(var item in data.data!.category!)
        {
          categories.add(item.name!);
          categoriesIds.add(item.id!);
        }
      emit(UserGetWalkingInfoSuccessState(data));
    });
  }
}
