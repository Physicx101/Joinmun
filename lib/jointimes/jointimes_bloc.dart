import 'dart:async';
import 'package:bloc/bloc.dart';


import 'index.dart';

class JointimesBloc extends Bloc<JointimesEvent, JointimesState> {
  static final JointimesBloc _jointimesBlocSingleton = JointimesBloc._internal();
  factory JointimesBloc() {
    return _jointimesBlocSingleton;
  }
  JointimesBloc._internal();


  JointimesState get initialState => JointimesLoading();

  

  @override
  Stream<JointimesState> mapEventToState(
    JointimesEvent event,
  ) async* {
    yield JointimesLoading();
    try {
      yield await event.applyAsync(currentState: currentState, bloc: this);
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield currentState;
    }
  }
}
