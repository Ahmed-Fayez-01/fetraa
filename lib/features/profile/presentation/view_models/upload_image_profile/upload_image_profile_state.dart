part of 'upload_image_profile_cubit.dart';

@immutable
abstract class UploadImageProfileState {}

class UploadImageProfileInitial extends UploadImageProfileState {}

class SelectProfileImageLoadingState extends UploadImageProfileState {}

class SelectProfileImageSuccessState extends UploadImageProfileState {
  final File? image;

  SelectProfileImageSuccessState({required this.image});
}

class ChangeUserTypeSuccessState extends UploadImageProfileState {}

class UploadRegisterResourcesLoadingState extends UploadImageProfileState {}

class UploadRegisterResourcesSuccessState extends UploadImageProfileState {
  final String link;

  UploadRegisterResourcesSuccessState(this.link);
}

class UploadRegisterResourcesErrorState extends UploadImageProfileState {}
class SelectWlaaCardSuccessState extends UploadImageProfileState {}
class DeleteWlaaCardSuccessState extends UploadImageProfileState {}
class SelectPassportImageSuccessState extends UploadImageProfileState {}
class DeletePassportImageSuccessState extends UploadImageProfileState {}
class SelectCvSuccessState extends UploadImageProfileState {}
class DeleteCvSuccessState extends UploadImageProfileState {}
class ClearRegisterResourcesState extends UploadImageProfileState {}
