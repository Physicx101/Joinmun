import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class DocumentsPage extends StatelessWidget {
  final title;

  const DocumentsPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: DocumentsList(),
    );
  }
}

class DocumentsList extends StatefulWidget {
  DocumentsList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DocumentsListState createState() => new _DocumentsListState();
}

class _DocumentsListState extends State<DocumentsList> {
  Future<Null> _launched;

  Future<Null> _launchCaller(String link) async {
    String url = link + '#pdfviewer';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final TextStyle titleStyle = const TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w500, fontFamily: 'Montserrat');
    final TextStyle documentStyle = const TextStyle(fontFamily: 'LemonMilk');

    return Scaffold(
        body: ListView(children: <Widget>[
      ExpansionTile(
          title: Text(
            'Rules of Procedure',
            style: titleStyle,
          ),
          children: <Widget>[
            ListTile(
              title: Text('JOINMUN', style: documentStyle,),
              leading: Icon(
                Icons.assignment,
                color: theme.accentColor,
              ),
              onTap: () => setState(() {
                    _launched = _launchCaller(
                        'https://simpan.ugm.ac.id/s/FRo9D1qBiF8fxOP');
                  }),
            ),
            ListTile(
              title: Text('PCA', style: documentStyle,),
              leading: Icon(
                Icons.assignment,
                color: theme.accentColor,
              ),
              onTap: () => setState(() {
                    _launched = _launchCaller(
                        'https://simpan.ugm.ac.id/s/nwdMswVY1dKkozE');
                  }),
            ),
            ListTile(
              title: Text('G20', style: documentStyle,),
              leading: Icon(
                Icons.assignment,
                color: theme.accentColor,
              ),
              onTap: () => setState(() {
                    _launched = _launchCaller(
                        'https://simpan.ugm.ac.id/s/l2BKb6Y2KsBPxmw');
                  }),
            ),
          ]),
      ExpansionTile(
          title: Text(
            'Study Guides',
            style: titleStyle,
          ),
          children: <Widget>[
            ListTile(
              title: Text('IPI', style: documentStyle,),
              leading: Icon(
                Icons.assignment,
                color: theme.accentColor,
              ),
              onTap: () => setState(() {
                    _launched = _launchCaller(
                        'https://simpan.ugm.ac.id/s/arcOATjhInSnxAF');
                  }),
            ),
            ListTile(
              title: Text('PCA', style: documentStyle,),
              leading: Icon(
                Icons.assignment,
                color: theme.accentColor,
              ),
              onTap: () => setState(() {
                    _launched = _launchCaller(
                        'https://simpan.ugm.ac.id/s/e6F7iy8hRr4b9GF');
                  }),
            ),
            ListTile(
              title: Text('G20', style: documentStyle,),
              leading: Icon(
                Icons.assignment,
                color: theme.accentColor,
              ),
              onTap: () => setState(() {
                    _launched = _launchCaller(
                        'https://simpan.ugm.ac.id/s/Cu0vPne0BdzmrCd');
                  }),
            ),
            ListTile(
              title: Text('SPECPOL', style: documentStyle,),
              leading: Icon(
                Icons.assignment,
                color: theme.accentColor,
              ),
              onTap: () => setState(() {
                    _launched = _launchCaller(
                        'https://simpan.ugm.ac.id/s/0QhN5ku61BslmiT');
                  }),
            ),
            ListTile(
              title: Text('UNFCCC', style: documentStyle,),
              leading: Icon(
                Icons.assignment,
                color: theme.accentColor,
              ),
              onTap: () => setState(() {
                    _launched = _launchCaller(
                        'https://simpan.ugm.ac.id/s/0QhN5ku61BslmiT');
                  }),
            ),
            ListTile(
              title: Text('UNHRC', style: documentStyle,),
              leading: Icon(
                Icons.assignment,
                color: theme.accentColor,
              ),
              onTap: () => setState(() {
                    _launched = _launchCaller(
                        'https://simpan.ugm.ac.id/s/qw3UHbnjNcXa8Dr');
                  }),
            ),
            ListTile(
              title: Text('UNSC', style: documentStyle,),
              leading: Icon(
                Icons.assignment,
                color: theme.accentColor,
              ),
              onTap: () => setState(() {
                    _launched = _launchCaller(
                        'https://simpan.ugm.ac.id/s/oNi1Zm8Yl1xyyWW');
                  }),
            ),
          ]),
    ]));
  }
}
