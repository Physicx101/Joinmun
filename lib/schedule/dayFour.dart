import 'package:flutter/material.dart';

class DayFour extends StatelessWidget {
  List<IconData> icon = [
    Icons.beenhere,
    Icons.directions_bus,
    Icons.restaurant
  ];
  List<String> scheduleName = ['Check out', 'Cultural Trip', 'Lunch'];
  List<String> scheduleTime = [
    '07:30 - 08:00',
    '09:00 - 12:00',
    '12:00 - 14:00'
  ];
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return new Container(
      child: new StreamBuilder(builder: (context, snapshot) {
        return new ListView.builder(
            itemCount: scheduleName.length,
            padding: const EdgeInsets.all(8.0),
            itemBuilder: (context, index) {
              return new Card(
                elevation: 0.0,
                margin: const EdgeInsets.all(8.0),
                child: new Column(
                  children: <Widget>[
                    new ListTile(
                      leading: new Icon(
                        icon[index],
                        color: theme.accentColor,
                        size: 32.0,
                      ),
                      title: new Text(
                        scheduleName[index],
                        style: new TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                            fontFamily: 'GoogleSans'),
                      ),
                      subtitle: new Text(
                        scheduleTime[index],
                        style: new TextStyle(
                            fontSize: 16.0, fontFamily: 'GoogleSans'),
                      ),
                    )
                  ],
                ),
              );
            });
      }),
    );
  }
}
