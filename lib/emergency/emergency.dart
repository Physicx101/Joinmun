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
        fontSize: 18.0, fontWeight: FontWeight.w500, fontFamily: 'Montserrat');

        final TextStyle childStyle = const TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w500, fontFamily: 'Montserrat');

    return Scaffold(
        body: ListView(children: <Widget>[
      ExpansionTile(
          title: Text(
            'Ambulance',
            style: titleStyle,
          ),
          children: <Widget>[
            ListTile(
              title: Text('Ambulance', style: childStyle,),
              subtitle: Text('+62274118', style: childStyle,),
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
              title: Text('Jogjakarta International Hospital', style: childStyle,),
              subtitle: Text('+622744463555', style: childStyle,),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+622744463555');
                  }),
            ),
            ListTile(
              title: Text('RSU Panti Rapih', style: childStyle,),
              subtitle: Text('+62274563333', style: childStyle,),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+62274563333');
                  }),
            ),
            ListTile(
              title: Text('RSU Sardjito', style: childStyle,),
              subtitle: Text('+62274587333', style: childStyle,),
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
              title: Text('Polda D I Yogyakarta', style: childStyle,),
              subtitle: Text('+62274886000', style: childStyle,),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+62274886000');
                  }),
            ),
            ListTile(
              title: Text('Polres Sleman', style: childStyle,),
              subtitle: Text('+62274868424', style: childStyle,),
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
              title: Text('Asa', style: childStyle,),
              subtitle: Text('+62274545545' ,style: childStyle,),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+62274545545');
                  }),
            ),
            ListTile(
              title: Text('Armada', style: childStyle,),
              subtitle: Text('+62274512787', style: childStyle,),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+62274512787');
                  }),
            ),
            ListTile(
              title: Text('Jas', style: childStyle,),
              subtitle: Text('+62274373737', style: childStyle,),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+62274373737');
                  }),
            ),
            ListTile(
              title: Text('Pataga', style: childStyle,),
              subtitle: Text('+62274371725', style: childStyle,),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+62274371725');
                  }),
            ),
            ListTile(
              title: Text('Vetri', style: childStyle,),
              subtitle: Text('+62274563551', style: childStyle,),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+62274563551');
                  }),
            ),
          ]),
    ]));
  }
}
