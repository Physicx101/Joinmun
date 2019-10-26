import 'package:flutter/material.dart';
import 'package:joinmun_2019/home/index.dart';
import 'package:joinmun_2019/universal/joinmun_scaffold.dart';

import 'home_screen.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    var _homeBloc = HomeBloc();
    

    return JoinmunScaffold(
      body: HomeScreen(homeBloc: _homeBloc),
      title: "Home",
    );
  }
}
