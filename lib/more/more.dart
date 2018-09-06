//import 'package:SquanchyFlutter/utils/button_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoreView extends StatelessWidget {
   @override
  Widget build(BuildContext context)
  {
    final theme = Theme.of(context);

    var appBar = new AppBar(
        iconTheme: theme.iconTheme,
        title: new Text("More Stuff", style: theme.textTheme.title.copyWith(color: Colors.white, fontWeight: FontWeight.w700),),
        backgroundColor: theme.primaryColor,
    );

    return new Scaffold(
      appBar: appBar,
      backgroundColor: theme.backgroundColor,
    );
  }
}
