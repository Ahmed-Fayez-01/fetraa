import 'package:bloc/bloc.dart';

import 'change_trainer_tabs_states.dart';

class ChangeTrainerTabsCubit extends Cubit<ChangeTrainerTabsStates> {
  ChangeTrainerTabsCubit() : super(ChangeTrainerTabsStatesInit());

  int selectedTab=0;

  changeTabs(int index){
    selectedTab=index;
    emit(ChangeTrainerTabsSuccessState());
  }
}
