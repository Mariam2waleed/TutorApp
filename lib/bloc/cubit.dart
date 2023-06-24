import 'package:bloc/bloc.dart';
import 'package:tutor/bloc/states.dart';

class TutorAppManager extends Cubit<TutorAppState> {
  TutorAppManager(super.initialState);

  bool test = false;
  change() {
    test = true;
    emit(ChnageBool());
    ////////
  }
}
