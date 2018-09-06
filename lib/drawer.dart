import 'dart:async';

import 'package:joinmun/page_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const String imgHeader = 'assets/img_drawer_header.png';

class MyDrawer extends StatelessWidget {
  MyDrawer({
    @required this.items,
    this.onTap,
    this.currentIndex: 0,
  }) : super() {
    assert(items != null);
    assert(0 <= currentIndex && currentIndex < items.length);
  }

  final List<PageContainer> items;

  final int currentIndex;

  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final List<Widget> lists = <Widget>[];
    for (int i = 0; i < items.length; i++) {
      PageContainer container = items[i];
      lists.add(
        new ListTile(
            leading: container.icon,
            title: new Text(container.title,
                style: new TextStyle(
                    fontFamily: 'LemonMilk', fontWeight: FontWeight.w300)),
            selected: currentIndex == i,
            onTap: () {
              Navigator.of(context).pop(); // Hide drawer
              if (onTap != null) onTap(i);
            }),
      );
    }

    return new Drawer(
      child: new Column(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text(
              "JOINMUN 2018",
              style: new TextStyle(fontFamily: 'LemonMilk', fontSize: 26.0, fontWeight: FontWeight.w700),
            ),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage(
                  imgHeader,
                ),
                fit: BoxFit.cover,
              ),
            ),
            margin: EdgeInsets.zero,
          ),
          new Expanded(
            child: new ListView(
              padding: const EdgeInsets.only(top: 8.0),
              children: <Widget>[
                new Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: lists,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
