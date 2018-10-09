import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joinmun/schedule/dayOne.dart';
import 'package:joinmun/schedule/dayTwo.dart';
import 'package:joinmun/schedule/dayThree.dart';
import 'package:joinmun/schedule/dayFour.dart';

class ScheduleView extends StatefulWidget {
  @override
  _ScheduleViewState createState() => new _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
    void initState() {
      controller = new TabController(vsync: this, length: 4);
      super.initState();
    }

    @override
      void dispose() {
        controller.dispose();
        super.dispose();
      }

 @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return new Scaffold(
      appBar: new PreferredSize(
         preferredSize: new Size.fromHeight(kTextTabBarHeight),
         child: new Material(
          color: theme.primaryColor,
          elevation: 4.0,
          child: new TabBar(
            labelStyle: TextStyle(fontFamily: 'Montserrat'),
            labelColor: theme.accentColor,
            unselectedLabelColor: Colors.grey,
            controller: controller,
            tabs: <Widget>[
              new Tab(text: "Day 1"),
              new Tab(text: "Day 2"),
              new Tab(text: "Day 3"),
              new Tab(text: "Day 4"),
          ],
        ),
      ),
    ),
     body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new DayOne(),
          new DayTwo(),
          new DayThree(),
          new DayFour()
        ],
      ),
    );
  }
}
