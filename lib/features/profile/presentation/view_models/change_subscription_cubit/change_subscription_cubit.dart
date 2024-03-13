import 'package:bloc/bloc.dart';
import 'change_subscription_states.dart';

class ChangeSubscriptionCubit extends Cubit<ChangeSubscriptionStates> {
  ChangeSubscriptionCubit() : super(ChangeSubscriptionStatesInit());

  int selectedSubscription=0;

  changeSubscription(int index){
    selectedSubscription=index;
    emit(ChangeSubscriptionSuccessState());
  }
}
