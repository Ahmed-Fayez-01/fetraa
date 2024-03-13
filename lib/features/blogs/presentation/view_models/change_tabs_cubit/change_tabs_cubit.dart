import 'package:bloc/bloc.dart';

import 'change_tabs_states.dart';

class ChangeTabsCubit extends Cubit<ChangeTabsStates> {
  ChangeTabsCubit() : super(ChangeTabsStatesInit());

  int selectedTab=0;

  changeTabs(int index){
    selectedTab=index;
    emit(ChangeTabsSuccessState());
  }
}
