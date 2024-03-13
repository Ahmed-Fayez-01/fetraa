import 'package:bloc/bloc.dart';

import 'change_video_tabs_states.dart';

class ChangeVideosTabsCubit extends Cubit<ChangeVideosTabsStates> {
  ChangeVideosTabsCubit() : super(ChangeVideosTabsStatesInit());

  int selectedTab=0;

  changeVideosTabs(int index){
    selectedTab=index;
    emit(ChangeVideosTabsSuccessState());
  }
}
