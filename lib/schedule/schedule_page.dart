import 'dart:math';

import 'package:flutter/material.dart';
import 'package:joinmun_2019/home/index.dart';
import 'package:joinmun_2019/model/schedule.dart';
import 'package:joinmun_2019/schedule/schedule_list.dart';
import 'package:joinmun_2019/universal/joinmun_scaffold.dart';
import 'package:joinmun_2019/utils/joinmun.dart';
import 'package:joinmun_2019/utils/tools.dart';

class SchedulePage extends StatelessWidget {
  static const String routeName = "/schedule";
  List<Schedule> schedules;

  @override
  Widget build(BuildContext context) {
    var _homeBloc = HomeBloc();
    var state = _homeBloc.currentState as InHomeState;
    var scheduleStream = state.schedules;

    return DefaultTabController(
      length: 4,
      child: JoinmunScaffold(
        title: "Schedule",
        tabBar: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Tools.multiColors[Random().nextInt(4)],
          labelStyle: TextStyle(
            fontSize: 12,
          ),
          isScrollable: false,
          tabs: <Widget>[
            Tab(
              child: Text("Day One", style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(fontSize: 12),),
            ),
            Tab(
              child: Text("Day Two", style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(fontSize: 12),),
            ),
            Tab(
              child: Text("Day Three", style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(fontSize: 12),),
            ),
            Tab(
              child: Text("Day Four", style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(fontSize: 12),),
            )
          ],
        ),
        body: StreamBuilder(
            stream: scheduleStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                schedules = snapshot.data.documents
                    .map<Schedule>((doc) => Schedule.fromMap(doc.data))
                    .toList();
                return TabBarView(
                  children: <Widget>[
                    ScheduleList(
                      allSchedules: schedules
                          .where((s) => s.scheduleDay == "one")
                          .toList()
                            ..sort(
                                (a, b) => a.scheduleId.compareTo(b.scheduleId)),
                    ),
                    ScheduleList(
                      allSchedules: schedules
                          .where((s) => s.scheduleDay == "two")
                          .toList()
                            ..sort(
                                (a, b) => a.scheduleId.compareTo(b.scheduleId)),
                    ),
                    ScheduleList(
                      allSchedules: schedules
                          .where((s) => s.scheduleDay == "three")
                          .toList()
                            ..sort(
                                (a, b) => a.scheduleId.compareTo(b.scheduleId)),
                    ),
                    ScheduleList(
                      allSchedules: schedules
                          .where((s) => s.scheduleDay == "four")
                          .toList()
                            ..sort(
                                (a, b) => a.scheduleId.compareTo(b.scheduleId)),
                    ),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
