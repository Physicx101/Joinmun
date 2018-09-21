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

  String ambulanceNumber = '+62274118';
  List<String> hospitalNumber = [
    '+622744463555',
    '+62274563333',
    '+62274587333'
  ];
  List<String> policeNumber = ['+62274886000', '+62274868424'];
  List<String> taxiNumber = [
    '+62274545545',
    '+62274512787',
    '+62274373737',
    '+62274371725',
    '+62274563551'
  ];
  final TextStyle headerStyle = const TextStyle(
      fontSize: 20.0, fontWeight: FontWeight.w500, fontFamily: 'GoogleSans');

  final TextStyle titleStyle = const TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.w500, fontFamily: 'GoogleSans');

      final TextStyle subtitleStyle = const TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: 'GoogleSans');

  Widget _ambulance(BuildContext context) => Container(
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: new Text(
                  "Ambulance",
                  style: headerStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new ListTile(
                  onTap: () => setState(() {
                        _launched = _launchCaller(ambulanceNumber);
                      }),
                  title: new Text("Ambulance", style: titleStyle,),
                  subtitle: new Text(ambulanceNumber, style: subtitleStyle,),
                  leading: new Icon(
                    Icons.cake,
                    color: Theme.of(context).accentColor,
                    size: 28.0,
                  ),
                  trailing: new Icon(Icons.call),
                ),
              ),
            ]),
      );

  Widget _hospital(BuildContext context) => Container(
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: new Text(
                  "Hospital",
                  style: headerStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new ListTile(
                  onTap: () => setState(() {
                        _launched = _launchCaller(hospitalNumber[0]);
                      }),
                  title: new Text("Jogjakarta Intternational Hospital", style: titleStyle,),
                  subtitle: new Text(hospitalNumber[0], style: subtitleStyle,),
                  leading: new Icon(
                    Icons.local_hospital,
                    color: Theme.of(context).accentColor,
                    size: 28.0,
                  ),
                  trailing: new Icon(Icons.call),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new ListTile(
                  onTap: () => setState(() {
                        _launched = _launchCaller(hospitalNumber[1]);
                      }),
                  title: new Text("RSU Panti Rapih", style: titleStyle,),
                  subtitle: new Text(hospitalNumber[1], style: subtitleStyle,),
                  leading: new Icon(
                    Icons.local_hospital,
                    color: Theme.of(context).accentColor,
                    size: 28.0,
                  ),
                  trailing: new Icon(Icons.call),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new ListTile(
                  onTap: () => setState(() {
                        _launched = _launchCaller(hospitalNumber[2]);
                      }),
                  title: new Text("RSU Sardjito", style: titleStyle,),
                  subtitle: new Text(hospitalNumber[2], style: subtitleStyle,),
                  leading: new Icon(
                    Icons.local_hospital,
                    color: Theme.of(context).accentColor,
                    size: 28.0,
                  ),
                  trailing: new Icon(Icons.call),
                ),
              ),
            ]),
      );

  Widget _police(BuildContext context) => Container(
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: new Text(
                  "Police",
                  style: headerStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new ListTile(
                  onTap: () => setState(() {
                        _launched = _launchCaller(policeNumber[0]);
                      }),
                  title: new Text("Polda D I Yogyakarta", style: titleStyle,),
                  subtitle: new Text(policeNumber[0], style: subtitleStyle,),
                  leading: new Icon(
                    Icons.cake,
                    color: Theme.of(context).accentColor,
                    size: 28.0,
                  ),
                  trailing: new Icon(Icons.call),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new ListTile(
                  onTap: () => setState(() {
                        _launched = _launchCaller(policeNumber[1]);
                      }),
                  title: new Text("Polres Sleman", style: titleStyle,),
                  subtitle: new Text(policeNumber[1], style: subtitleStyle,),
                  leading: new Icon(
                    Icons.cake,
                    color: Theme.of(context).accentColor,
                    size: 28.0,
                  ),
                  trailing: new Icon(Icons.call),
                ),
              ),
            ]),
      );

  Widget _taxi(BuildContext context) => Container(
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: new Text(
                  "Taxi",
                  style: headerStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new ListTile(
                  onTap: () => setState(() {
                        _launched = _launchCaller(taxiNumber[0]);
                      }),
                  title: new Text("Asa", style: titleStyle,),
                  subtitle: new Text(
                    taxiNumber[0], style: subtitleStyle,
                  ),
                  leading: new Icon(
                    Icons.local_taxi,
                    color: Theme.of(context).accentColor,
                    size: 28.0,
                  ),
                  trailing: new Icon(Icons.call),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new ListTile(
                  onTap: () => setState(() {
                        _launched = _launchCaller(taxiNumber[1]);
                      }),
                  title: new Text("Armada", style: titleStyle,),
                  subtitle: new Text(taxiNumber[1], style: subtitleStyle,),
                  leading: new Icon(
                    Icons.local_taxi,
                    color: Theme.of(context).accentColor,
                    size: 28.0,
                  ),
                  trailing: new Icon(Icons.call),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new ListTile(
                  onTap: () => setState(() {
                        _launched = _launchCaller(taxiNumber[2]);
                      }),
                  title: new Text("Jas", style: titleStyle,),
                  subtitle: new Text(taxiNumber[2], style: subtitleStyle,),
                  leading: new Icon(
                    Icons.local_taxi,
                    color: Theme.of(context).accentColor,
                    size: 28.0,
                  ),
                  trailing: new Icon(Icons.call),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new ListTile(
                  onTap: () => setState(() {
                        _launched = _launchCaller(taxiNumber[3]);
                      }),
                  title: new Text("Pataga", style: titleStyle,),
                  subtitle: new Text(taxiNumber[3], style: subtitleStyle,),
                  leading: new Icon(
                    Icons.local_taxi,
                    color: Theme.of(context).accentColor,
                    size: 28.0,
                  ),
                  trailing: new Icon(Icons.call),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new ListTile(
                  onTap: () => setState(() {
                        _launched = _launchCaller(taxiNumber[4]);
                      }),
                  title: new Text("Vetri", style: titleStyle,),
                  subtitle: new Text(taxiNumber[4], style: subtitleStyle,),
                  leading: new Icon(
                    Icons.local_taxi,
                    color: Theme.of(context).accentColor,
                    size: 28.0,
                  ),
                  trailing: new Icon(Icons.call),
                ),
              ),
            ]),
      );

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _ambulance(context),
            _hospital(context),
            _police(context),
            _taxi(context),
          ],
        ),
      ),
    );
  }
}
