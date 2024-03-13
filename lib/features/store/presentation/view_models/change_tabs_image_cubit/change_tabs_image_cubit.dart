import 'package:bloc/bloc.dart';

import 'change_tabs_image_states.dart';

class ChangeTabsImageCubit extends Cubit<ChangeTabsImageStates> {
  ChangeTabsImageCubit() : super(ChangeTabsImageStatesInit());

  int selectedTab=0;

  changeTabs(int index){
    selectedTab=index;
    emit(ChangeTabsImageSuccessState());
  }
}
