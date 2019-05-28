import 'package:flutter/material.dart';


class DayOne extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    List<IconData> icon = [Icons.hotel, Icons.assignment, Icons.stars, Icons.restaurant, Icons.group];
    List<String> scheduleName = ['Hotel Check-In for Accommodation', 'Delegates Registration', 'Opening Ceremony', 'Dinner', 'Conference Zero'];
    List<String> scheduleTime = ['10:00 - 14:00', '14:00 - 15:30', '16:00 - 18:00', '18:00 - 19:15', '19:15 - 20:30'];
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
                    title: new Text(scheduleName[index], style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0, fontFamily: 'Montserrat'),),
                    subtitle: new Text(scheduleTime[index], style: new TextStyle(fontSize: 16.0, fontFamily: 'Montserrat'),),
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



 
