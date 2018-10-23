import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  List<People> allPeople;
  StreamSubscription<QuerySnapshot> sub;

  @override
  void initState() {
    super.initState();

    final CollectionReference collection =
        Firestore.instance.collection('relations');
    sub = collection.snapshots().listen((QuerySnapshot snapshot) {
      setState(() {
        allPeople = snapshot.documents.map(_toPeople).toList();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    sub?.cancel();
  }

  Future<Null> _launched;

  Future<Null> _launchCaller(String number) async {
    String url = "tel:$number";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<Widget> _createPeopleCard(
      BuildContext context, Iterable<People> people) {
    List<Widget> widgets = [];
    final List<People> listPeople = people.toList();
    for (var i = 0; i < listPeople.length; i++) {
      People people = listPeople[i];
      Widget peopleCard = PeopleCard(people);
      widgets.add(peopleCard);
    }
    return widgets;
  }

  static People _toPeople(DocumentSnapshot snapshot) {
    return new People(
      name: snapshot['name'],
      position: snapshot['position'],
      phone: snapshot['phone'],
      email: snapshot['email'],
      image: snapshot['image'],
    );
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
              title: Text(
                'Ambulance',
                style: childStyle,
              ),
              subtitle: Text(
                '+62274118',
                style: childStyle,
              ),
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
              title: Text(
                'Jogjakarta International Hospital',
                style: childStyle,
              ),
              subtitle: Text(
                '+622744463555',
                style: childStyle,
              ),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+622744463555');
                  }),
            ),
            ListTile(
              title: Text(
                'RSU Panti Rapih',
                style: childStyle,
              ),
              subtitle: Text(
                '+62274563333',
                style: childStyle,
              ),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+62274563333');
                  }),
            ),
            ListTile(
              title: Text(
                'RSU Sardjito',
                style: childStyle,
              ),
              subtitle: Text(
                '+62274587333',
                style: childStyle,
              ),
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
              title: Text(
                'Polda D I Yogyakarta',
                style: childStyle,
              ),
              subtitle: Text(
                '+62274886000',
                style: childStyle,
              ),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+62274886000');
                  }),
            ),
            ListTile(
              title: Text(
                'Polres Sleman',
                style: childStyle,
              ),
              subtitle: Text(
                '+62274868424',
                style: childStyle,
              ),
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
              title: Text(
                'Asa',
                style: childStyle,
              ),
              subtitle: Text(
                '+62274545545',
                style: childStyle,
              ),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+62274545545');
                  }),
            ),
            ListTile(
              title: Text(
                'Armada',
                style: childStyle,
              ),
              subtitle: Text(
                '+62274512787',
                style: childStyle,
              ),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+62274512787');
                  }),
            ),
            ListTile(
              title: Text(
                'Jas',
                style: childStyle,
              ),
              subtitle: Text(
                '+62274373737',
                style: childStyle,
              ),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+62274373737');
                  }),
            ),
            ListTile(
              title: Text(
                'Pataga',
                style: childStyle,
              ),
              subtitle: Text(
                '+62274371725',
                style: childStyle,
              ),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+62274371725');
                  }),
            ),
            ListTile(
              title: Text(
                'Vetri',
                style: childStyle,
              ),
              subtitle: Text(
                '+62274563551',
                style: childStyle,
              ),
              trailing: Icon(Icons.call),
              onTap: () => setState(() {
                    _launched = _launchCaller('+62274563551');
                  }),
            ),
          ]),
      ExpansionTile(
          title: Text(
            "Delegates' Relations Staffs",
            style: titleStyle,
          ),
          children: _createPeopleCard(context, allPeople.toList())),
    ]));
  }
}

class PeopleCard extends StatelessWidget {
  final People people;

  PeopleCard(this.people);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Card(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ProfileTile(
                title: people.name,
                subtitle: people.position,
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.email),
                    color: theme.accentColor,
                    onPressed: () async {
                      if (await canLaunch('mailto:' +
                          people.email +
                          '?subject=DELEGATE&body=Hello,')) {
                        await launch('mailto:' +
                            people.email +
                            '?subject=DELEGATE&body=Hello,');
                      }
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(50.0)),
                      border: new Border.all(
                        width: 4.0,
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(people.image),
                      foregroundColor: theme.accentColor,
                      radius: 40.0,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.call),
                    color: theme.accentColor,
                    onPressed: () async {
                      if (await canLaunch('tel:' + people.phone)) {
                        await launch('tel:' + people.phone);
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final title;
  final subtitle;

  ProfileTile({
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat'),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          subtitle,
          style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.normal,
              fontFamily: 'Montserrat'),
        ),
      ],
    );
  }
}

class People implements Comparable<People> {
  final String name;
  final String position;
  final String phone;
  final String email;
  final String image;

  People({this.name, this.position, this.phone, this.email, this.image});

  @override
  int compareTo(People other) => position.compareTo(other.position);
}
