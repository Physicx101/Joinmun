import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joinmun/schedule/schedule.dart';
import 'package:joinmun/event/event.dart';
//import 'package:joinmun/event/eventdetails.dart';
import 'package:joinmun/catalogue/catalogue.dart';
import 'package:joinmun/more/more.dart';
import 'package:joinmun/drawer.dart';
import 'package:joinmun/explore/map.dart';
import 'package:joinmun/page_container.dart';
import 'package:joinmun/home/home.dart';




class RootView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RootViewState();
  }
}


class _RootViewState extends State<RootView> with TickerProviderStateMixin {
  String _title = "";
  int _currentIndex = 0;
  List<PageContainer> _pages;

  @override
    void dispose() {
      if (_pages != null) {
        for (PageContainer container in _pages) {
          container.controller.dispose();
        }
      }
      super.dispose();
    }

    List<PageContainer> _createPages() {
      return <PageContainer>[
        new PageContainer(
          title: "Home",
          icon: new Icon(Icons.home),
          hasTab: true,
          body: () => new HomeView(),
          tickerProvider: this,
        ),
        new PageContainer(
          title: "Schedule",
          icon: new Icon(Icons.schedule),
          hasTab: true,
          body: () => new ScheduleView(),
          tickerProvider: this,
        ),
        new PageContainer(
          title: "Events",
          icon: new Icon(Icons.event),
          hasTab: false,
          body: () => new EventView(),
          tickerProvider: this,
        ),
         new PageContainer(
          title: "Explore",
          icon: new Icon(Icons.explore),
          hasTab: false,
          body: () => new ScheduleView(),
          tickerProvider: this,
        ),
         new PageContainer(
          title: "Documents",
          icon: new Icon(Icons.book),
          hasTab: false,
          body: () => new ScheduleView(),
          tickerProvider: this,
        ),
         new PageContainer(
          title: "Merchandise",
          icon: new Icon(Icons.local_mall),
          hasTab: false,
          body: () => new CatalogueView(),
          tickerProvider: this,
        ),
         new PageContainer(
          title: "Emergency Contacts",
          icon: new Icon(Icons.contact_phone),
          hasTab: false,
          body: () => new EventView(),
          tickerProvider: this,
        ),
         new PageContainer(
          title: "Feedback",
          icon: new Icon(Icons.feedback),
          hasTab: false,
          body: () => new EventView(),
          tickerProvider: this,
        ),
      ];
    }

    Widget _buildTransitionsStack() {
      final List<FadeTransition> transitions = <FadeTransition>[];

      for (PageContainer container in _pages) {
        transitions.add(container.transition());
      }

      transitions.sort((FadeTransition a, FadeTransition b) {
      final Animation<double> aAnimation = a.opacity;
      final Animation<double> bAnimation = b.opacity;
      final double aValue = aAnimation.value;
      final double bValue = bAnimation.value;
      return aValue.compareTo(bValue);
    });

    return new Stack(children: transitions);
    }




   
 @override
 Widget build(BuildContext context) {
    _pages = _createPages();

    PageContainer _page = _pages[_currentIndex];
    _page.controller.value = 1.0;
    _title = _page.title.toString();
   

   return Scaffold(
     appBar: new AppBar(
        title: new Text(_title),
        elevation: _page.hasTab ? 0.0 : 4.0,
      ),
     drawer: new MyDrawer(
       items: _pages,
       currentIndex: _currentIndex,
       onTap: (int index) {
         setState(() {
                    _page.controller.reverse();
                    _currentIndex = index;
                    _page.controller.forward();
                    _title = _page.title.toString();
                  
                  });
       },
     ),
     body: new Center(
       child: _buildTransitionsStack(),
     )
   );
 }

}

  

  
