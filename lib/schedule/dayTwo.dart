import 'package:flutter/material.dart';

class DayTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<IconData> icon = [
      Icons.supervised_user_circle,
      Icons.restaurant,
      Icons.supervised_user_circle,
      Icons.local_cafe,
      Icons.supervised_user_circle,
      Icons.local_cafe,
      Icons.supervised_user_circle,
      Icons.local_bar
    ];

    List<String> scheduleName = [
      'Committee Session I',
      'Friday Prayer & Lunch Break',
      'Committee Session II',
      'Coffee Break',
      'Committee Session III',
      'Coffee Break',
      'Committee Session IV',
      'Social Night'
    ];

    List<String> scheduleTime = [
      '9:00 - 11:30',
      '11:30 - 14:00',
      '14:00 - 16:00',
      '16:00 - 16:30',
      '16:30 - 18:00',
      '18:00 - 18:30',
      '18:30 - 19:30',
      '20:00 - 23:30'
    ];
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
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                            fontFamily: 'CenturyGothic'),
                      ),
                      subtitle: new Text(
                        scheduleTime[index],
                        style: new TextStyle(
                            fontSize: 16.0, fontFamily: 'CenturyGothic'),
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
