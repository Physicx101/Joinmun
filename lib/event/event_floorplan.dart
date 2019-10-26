import 'dart:math';

import 'package:flutter/material.dart';
import 'package:joinmun_2019/model/event.dart';
import 'package:joinmun_2019/universal/joinmun_scaffold.dart';
import 'package:joinmun_2019/utils/tools.dart';
import 'package:photo_view/photo_view.dart';

class EventFloorPlan extends StatelessWidget {
  final Event event;

  EventFloorPlan({Key key, @required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (event.eventTitle == "Opening Ceremony") {
      return JoinmunScaffold(
          title: event.eventTitle + "'s Floor Plan",
          body: Container(
            child: PhotoView(
              imageProvider: NetworkImage(
                event.eventFloorplanA,
              ),
            ),
          ));
    } else {
      return DefaultTabController(
        length: 2,
        child: JoinmunScaffold(
            title: event.eventTitle + "'s Floor Plan",
            tabBar: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Tools.multiColors[Random().nextInt(4)],
              labelStyle: TextStyle(
                fontSize: 12,
              ),
              isScrollable: false,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    "Ballroom",
                    style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(fontSize: 12),
                  ),
                ),
                Tab(
                  child: Text(
                    "Mustika",
                    style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(fontSize: 12),
                  ),
                ),
              ],
            ),
            body: TabBarView(
              children: <Widget>[
                Container(
                  child: PhotoView(
                    imageProvider: NetworkImage(
                      event.eventFloorplanA,
                    ),
                  ),
                ),
                Container(
                  child: PhotoView(
                    imageProvider: NetworkImage(
                      event.eventFloorplanB,
                    ),
                  ),
                ),
              ],
            )),
      );
    }
  }
}
