import 'dart:async';

import 'package:flutter/material.dart';
import 'package:joinmun_2019/home/index.dart';
import 'package:joinmun_2019/jointimes/jointimes_bloc.dart';
import 'package:joinmun_2019/universal/joinmun_scaffold.dart';

import 'jointimes_screen.dart';

class JointimesPage extends StatelessWidget {
  static const String routeName = "/jointimes";

  @override
  Widget build(BuildContext context) {
    var _jointimesBloc = JointimesBloc();
    var _refreshCompleter = Completer<void>();

    return JoinmunScaffold(
      body: JointimesScreen(jointimesBloc: _jointimesBloc, refreshCompleter: _refreshCompleter,),
      title: "JOINTIMES",
    );
  }
}
