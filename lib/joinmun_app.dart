import 'package:joinmun/rootview.dart';
import 'package:flutter/material.dart';

class JoinmunFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      title: base.title.copyWith(
        fontFamily: 'LemonMilk',
        ),
      );
    }

    ThemeData _buildTheme() {
      const Color primaryColor = const Color(0xFF2D3347);
      final ThemeData base = new ThemeData.light();
      return base.copyWith(
        primaryColor: primaryColor,
        indicatorColor: const Color(0xFFEF544F),
        accentColor: const Color(0xFFEF544F),
        backgroundColor: const Color.fromRGBO(244, 244, 244, 1.0),
        textTheme: _buildTextTheme(base.textTheme),
        primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      );
    }

    
        

    return new MaterialApp(
        theme: _buildTheme(),
        title: 'JOINMUN 2018',
        home: new RootView(),
        );
  }
}
