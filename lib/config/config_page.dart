import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joinmun_2019/chair/chair_page.dart';
import 'package:joinmun_2019/config/index.dart';
import 'package:joinmun_2019/contact/contact_page.dart';
import 'package:joinmun_2019/event/event_page.dart';
import 'package:joinmun_2019/home/index.dart';
import 'package:joinmun_2019/jointimes/jointimes_page.dart';
import 'package:joinmun_2019/merch/merch_page.dart';
import 'package:joinmun_2019/place/place_page.dart';
import 'package:joinmun_2019/schedule/schedule_page.dart';
import 'package:joinmun_2019/speaker/speaker_page.dart';
import 'package:joinmun_2019/sponsor/sponsor_page.dart';
import 'package:joinmun_2019/utils/joinmun.dart';

import '../utils/firebase_notifications.dart';

class ConfigPage extends StatefulWidget {
  static const String routeName = "/";
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  ConfigBloc configBloc;

  @override
  void initState() {
    super.initState();
    setupApp();
  }

  setupApp() {
    configBloc = ConfigBloc();
    configBloc.darkModeOn =
        Joinmun.prefs.getBool(Joinmun.darkModePref) ?? false;
    FirebaseNotifications().setUpFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => configBloc,
      child: BlocBuilder<ConfigBloc, ConfigState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'JOINMUN 2019',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: Joinmun.avenir_family,
              primarySwatch: Colors.orange,
              primaryColor: configBloc.darkModeOn ? Colors.black : Colors.white,
              disabledColor: Colors.grey,
              cardColor: configBloc.darkModeOn ? Colors.black : Colors.white,
              canvasColor:
                  configBloc.darkModeOn ? Colors.black : Colors.grey[50],
              brightness:
                  configBloc.darkModeOn ? Brightness.dark : Brightness.light,
              buttonTheme: Theme.of(context).buttonTheme.copyWith(
                  colorScheme: configBloc.darkModeOn
                      ? ColorScheme.dark()
                      : ColorScheme.light()),
              appBarTheme: AppBarTheme(
                elevation: 0.0,
              ),
            ),
            home: HomePage(),
            routes: {
              HomePage.routeName: (context) => HomePage(),
              SchedulePage.routeName: (context) => SchedulePage(),
              SpeakerPage.routeName: (context) => SpeakerPage(),
              PlacePage.routeName: (context) => PlacePage(),
              ChairPage.routeName: (context) => ChairPage(),
              MerchPage.routeName: (context) => MerchPage(),
              JointimesPage.routeName: (context) => JointimesPage(),
              ContactPage.routeName: (context) => ContactPage(),
              EventPage.routeName: (context) => EventPage(),
              SponsorPage.routeName: (context) => SponsorPage(),
            },  
          );
        },
      ),
    );
  }
}
