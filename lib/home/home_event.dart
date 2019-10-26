import 'dart:async';
import 'package:joinmun_2019/home/home_provider.dart';
import 'package:joinmun_2019/home/index.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

@immutable
abstract class HomeEvent {
  Future<HomeState> applyAsync({HomeState currentState, HomeBloc bloc});
}

class LoadHomeEvent extends HomeEvent {
  final IHomeProvider _homeProvider = HomeProvider();
  @override
  String toString() => 'LoadHomeEvent';

  @override
  Future<HomeState> applyAsync({HomeState currentState, HomeBloc bloc}) async {
    try {
      var sponsors = await _homeProvider.getSponsors();
      var speakers = await _homeProvider.getSpeakers();
      var merchData = await _homeProvider.getMerch();
      var events = await _homeProvider.getEvents();
      var schedules = await _homeProvider.getSchedules();
      var places = await _homeProvider.getPlaces();
      var chairs = await _homeProvider.getChairs();
      var jointimes = await _homeProvider.getJointimes();
      var contacts = await _homeProvider.getContacts();
      return InHomeState(
        sponsors: sponsors,
        speakers: speakers,
        merchData: merchData,
        events: events,
        schedules: schedules,
        places: places,
        chairs: chairs,
        jointimes: jointimes,
        contacts: contacts,
      );
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      return ErrorHomeState(_?.toString());
    }
  }


}
