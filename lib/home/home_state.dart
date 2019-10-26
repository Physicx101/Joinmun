import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:joinmun_2019/model/merch.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeState extends Equatable {
  HomeState([Iterable props]) : super();

  /// Copy object for use in action
  HomeState getStateCopy();
}

/// UnInitialized
class UnHomeState extends HomeState {
  @override
  String toString() => 'UnHomeState';

  @override
  HomeState getStateCopy() {
    return UnHomeState();
  }

  @override
  List<Object> get props => null;
}

/// Initialized
class InHomeState extends HomeState {
  final Stream<QuerySnapshot> sponsors;
  final Stream<QuerySnapshot> speakers;
  final MerchData merchData;
  final Stream<QuerySnapshot> events;
  final Stream<QuerySnapshot> schedules;
  final Stream<QuerySnapshot> places;
  final Stream<QuerySnapshot> chairs;
  final Stream<QuerySnapshot> jointimes;
  final Stream<QuerySnapshot> contacts;

  InHomeState({
    @required this.sponsors,
    @required this.speakers,
    @required this.merchData,
    @required this.events,
    @required this.schedules,
    @required this.places,
    @required this.chairs,
    @required this.jointimes,
    @required this.contacts,
  }) : super([
          //postData,
          speakers, merchData, events, schedules, places, chairs, jointimes,
          contacts
        ]);
  @override
  String toString() => 'InHomeState';

  @override
  HomeState getStateCopy() {
    return InHomeState(
      sponsors: this.sponsors,
      speakers: this.speakers,
      merchData: this.merchData,
      events: this.events,
      schedules: this.schedules,
      places: this.places,
      chairs: this.chairs,
      jointimes: this.jointimes,
      contacts: this.contacts,
    );
  }

  @override
  List<Object> get props => null;
}

class ErrorHomeState extends HomeState {
  final String errorMessage;

  ErrorHomeState(this.errorMessage);

  @override
  String toString() => 'ErrorHomeState';

  @override
  HomeState getStateCopy() {
    return ErrorHomeState(this.errorMessage);
  }

  @override
  List<Object> get props => null;
}
