import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:joinmun_2019/config/index.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  static final ConfigBloc _configBlocSingleton = ConfigBloc._internal();
  factory ConfigBloc() {
    return _configBlocSingleton;
  }
  ConfigBloc._internal();

  bool darkModeOn = false;

  ConfigState get initialState => new UnConfigState();

  @override
  Stream<ConfigState> mapEventToState(
    ConfigEvent event,
  ) async* {
    try {
      yield UnConfigState();
      yield await event.applyAsync(currentState: currentState, bloc: this);
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield currentState;
    }
  }
}
