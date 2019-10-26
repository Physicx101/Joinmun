import 'dart:math';

import 'package:flutter/material.dart';
import 'package:joinmun_2019/model/place.dart';
import 'package:joinmun_2019/place/place_list.dart';
import 'package:joinmun_2019/home/index.dart';
import 'package:joinmun_2019/universal/joinmun_scaffold.dart';
import 'package:joinmun_2019/utils/tools.dart';

class PlacePage extends StatelessWidget {
  static const String routeName = "/place";
  List<Place> places;

  @override
  Widget build(BuildContext context) {
    var _homeBloc = HomeBloc();
    var state = _homeBloc.currentState as InHomeState;
    var placeStream = state.places;

    return DefaultTabController(
      length: 5,
      child: JoinmunScaffold(
        title: "Places to Visit",
        tabBar: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Tools.multiColors[Random().nextInt(4)],
          labelStyle: TextStyle(
            fontSize: 12,
          ),
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              child: Text("Arts & Museum", style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(fontSize: 12),),
            ),
            Tab(
              child: Text("Landmarks", style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(fontSize: 12),),
            ),
            Tab(
              child: Text("Souvenir", style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(fontSize: 12),),
            ),
            Tab(
              child: Text("Nature", style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(fontSize: 12),),
            ),
            Tab(
              child: Text("Culinary", style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(fontSize: 12),),
            )
          ],
        ),
        body: StreamBuilder(
            stream: placeStream,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                places = snapshot.data.documents
                    .map<Place>((doc) => Place.fromMap(doc.data))
                    .toList();
                return TabBarView(
                  children: <Widget>[
                    PlaceList(
                        allPlaces: places
                            .where((p) => p.placeType == 'Arts and Museum')
                            .toList()),
                    PlaceList(
                        allPlaces: places
                            .where(
                                (Place place) => place.placeType == 'Landmarks')
                            .toList()),
                    PlaceList(
                        allPlaces: places
                            .where(
                                (Place place) => place.placeType == 'Souvenir')
                            .toList()),
                    PlaceList(
                        allPlaces: places
                            .where((Place place) => place.placeType == 'Nature')
                            .toList()),
                    PlaceList(
                        allPlaces: places
                            .where(
                                (Place place) => place.placeType == 'Culinary')
                            .toList()),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
