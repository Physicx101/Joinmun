import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:joinmun_2019/utils/dependency_injection.dart';
import 'package:joinmun_2019/utils/joinmun.dart';
import 'package:joinmun_2019/utils/service_locator.dart';
import 'package:joinmun_2019/utils/simple_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/config_page.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  Joinmun.prefs = await SharedPreferences.getInstance();

  Joinmun.checkDebug();

  BlocSupervisor.delegate = SimpleBlocDelegate();

  Injector.configure(Flavor.FIREBASE, DataMode.JSON);

  setupLocator();

  runApp(ConfigPage());
}
