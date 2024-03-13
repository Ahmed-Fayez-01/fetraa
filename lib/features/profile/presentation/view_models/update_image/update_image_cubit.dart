import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:fetraa/features/profile/data/models/update_image_model.dart';
import 'package:fetraa/features/profile/data/repos/profile_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:fetraa/core/utils/services/local_services/cache_helper.dart';


part 'update_image_state.dart';

class UpdateImageCubit extends Cubit<UpdateImageState> {
  UpdateImageCubit(this.profileRepo) : super(UpdateImageInitial());
  ProfileRepo? profileRepo;
  Future<void> updateImageUser({required var image}) async {
    emit(UserUpdateImageLoadingState());
    var result = await profileRepo!.updateImage(image: image);
    return result.fold((failure) {
      print("klfjlkjsk;l${failure.errMessage}");
      emit(UserUpdateImageErrorState(failure.errMessage));
    }, (data) {
      print("klkdsjksopdsd");
      CacheHelper.saveData(key: "img", value: data.data!.img!);
      emit(UserUpdateImageSuccessState(data));
    });
  }
}
