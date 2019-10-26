import 'package:flutter/material.dart';
import 'package:joinmun_2019/model/schedule.dart';

class ScheduleList extends StatelessWidget {
  final List<Schedule> allSchedules;

  const ScheduleList({Key key, @required this.allSchedules}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: allSchedules.length,
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, index) {
          return new Card(
            elevation: 0.0,
            margin: const EdgeInsets.all(8.0),
            child: new Column(
              children: <Widget>[
                new ListTile(
                  title: new Text(
                    allSchedules[index].scheduleTitle,
                    style: new TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                        fontFamily: 'Avenir'),
                  ),
                  subtitle: allSchedules[index].schedulePlace == ""
                      ? new Text(
                          allSchedules[index].scheduleStartTime +
                              " - " +
                              allSchedules[index].scheduleEndTime,
                          style: new TextStyle(
                              fontSize: 16.0, fontFamily: 'Avenir'),
                        )
                      : new Text(
                          allSchedules[index].scheduleStartTime +
                              " - " +
                              allSchedules[index].scheduleEndTime +
                              "  •  " +
                              allSchedules[index].schedulePlace,
                          style: new TextStyle(
                              fontSize: 16.0, fontFamily: 'Avenir'),
                        ),
                )
              ],
            ),
          );
        });
  }
}
