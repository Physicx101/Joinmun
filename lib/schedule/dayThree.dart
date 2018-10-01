import 'package:flutter/material.dart';



class DayThree extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
      List<IconData> icon = [
           Icons.assignment,
        Icons.supervised_user_circle,
        Icons.local_cafe,
        Icons.supervised_user_circle,
        Icons.restaurant,
        Icons.supervised_user_circle,
        Icons.local_cafe,
        Icons.supervised_user_circle,
        Icons.stars];

      List<String> scheduleName = [
        'Registration',
        'Committee Session V',
        'Coffee Break',
        'Committee Session VI',
        'Lunch Break', 
        'Committee Session VII',
        'Coffee Break',
        'Committee Session VIII',
        'Closing Ceremony'
      ]  ;

      List<String> scheduleTime = [
        '07:30 - 08:15',
        '08:30 - 10:00',
        '10:00 - 10:15',
        '10:15 - 11:45',
        '11:45 - 12:30',
        '12:45 - 15:15',
        '15:15 - 15:30',
        '15:30 - 16:45',
        '20:00 - 23:30'
      ];
    var theme = Theme.of(context);
    return new Container(
      child: new StreamBuilder(
          builder: (context, snapshot) {
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
                    leading: new Icon(icon[index], color: theme.accentColor, size: 32.0,),
                    title: new Text(scheduleName[index], style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0, fontFamily: 'GoogleSans'),),
                    subtitle: new Text(scheduleTime[index], style: new TextStyle(fontSize: 16.0, fontFamily: 'GoogleSans'),),
          )
        ],
      ),
    );
              }
            );
          }),
    );
  }
}



 
