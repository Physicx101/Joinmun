import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsPage extends StatelessWidget {
  final title;

  const ContactsPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ContactsList(),
    );
  }
}

class ContactsList extends StatefulWidget {
  ContactsList({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ContactsListState createState() => new _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  Future<Null> _launched;

  Future<Null> _launchCaller(String number) async {
    String url = "tel:$number";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = const TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w500, fontFamily: 'GoogleSans');

    return Scaffold(
        body: ListView(children: <Widget>[
      ExpansionTile(
          title: Text(
            'Ambulance',
            style: titleStyle,
          ),
          children: <Widget>[
            ListTile(
              title: Text('Ambulance'),
              subtitle: Text('+62274118'),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+62274118');
                  }),
            ),
          ]),
      ExpansionTile(
          title: Text(
            'Hospital',
            style: titleStyle,
          ),
          children: <Widget>[
            ListTile(
              title: Text('Jogjakarta International Hospital'),
              subtitle: Text('+622744463555'),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+622744463555');
                  }),
            ),
            ListTile(
              title: Text('RSU Panti Rapih'),
              subtitle: Text('+62274563333'),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+62274563333');
                  }),
            ),
            ListTile(
              title: Text('RSU Sardjito'),
              subtitle: Text('+62274587333'),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+62274587333');
                  }),
            ),
          ]),
      ExpansionTile(
          title: Text(
            'Police',
            style: titleStyle,
          ),
          children: <Widget>[
            ListTile(
              title: Text('Polda D I Yogyakarta'),
              subtitle: Text('+62274886000'),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+62274886000');
                  }),
            ),
            ListTile(
              title: Text('Polres Sleman'),
              subtitle: Text('+62274868424'),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+62274868424');
                  }),
            ),
          ]),
      ExpansionTile(
          title: Text(
            'Taxi',
            style: titleStyle,
          ),
          children: <Widget>[
            ListTile(
              title: Text('Asa'),
              subtitle: Text('+62274545545'),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+62274545545');
                  }),
            ),
            ListTile(
              title: Text('Armada'),
              subtitle: Text('+62274512787'),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+62274512787');
                  }),
            ),
            ListTile(
              title: Text('Jas'),
              subtitle: Text('+62274373737'),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+62274373737');
                  }),
            ),
            ListTile(
              title: Text('Pataga'),
              subtitle: Text('+62274371725'),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+62274371725');
                  }),
            ),
            ListTile(
              title: Text('Vetri'),
              subtitle: Text('+62274563551'),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+62274563551');
                  }),
            ),
          ]),
    ]));
  }
}
