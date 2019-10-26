import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joinmun_2019/contact/contact_list.dart';
import 'package:joinmun_2019/home/home_bloc.dart';
import 'package:joinmun_2019/home/index.dart';
import 'package:joinmun_2019/model/contact.dart';
import 'package:joinmun_2019/universal/joinmun_scaffold.dart';
import 'package:joinmun_2019/utils/calls_and_messages_service.dart';
import 'package:joinmun_2019/utils/service_locator.dart';
import 'package:joinmun_2019/utils/tools.dart';

class ContactPage extends StatelessWidget {
  static const String routeName = "/contacts";
   List<Contact> contacts = [];
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

  Widget emergencyContacts(context) => ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: ExpansionTile(
                title: Text(
                  'Ambulance',
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Ambulance',
                    ),
                    trailing: Icon(
                      FontAwesomeIcons.phoneAlt,
                      size: 18.0,
                    ),
                    onTap: () => _service.call("+62274118"),
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: ExpansionTile(
                title: Text(
                  'Hospital',
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Jogjakarta International Hospital',
                    ),
                    trailing: Icon(
                      FontAwesomeIcons.phoneAlt,
                      size: 18.0,
                    ),
                    onTap: () => _service.call("+622744463555"),
                  ),
                  ListTile(
                    title: Text(
                      'RSU Panti Rapih',
                    ),
                    trailing: Icon(
                      FontAwesomeIcons.phoneAlt,
                      size: 18.0,
                    ),
                    onTap: () => _service.call("+62274563333"),
                  ),
                  ListTile(
                    title: Text(
                      'RSU Sardjito',
                    ),
                    trailing: Icon(
                      FontAwesomeIcons.phoneAlt,
                      size: 18.0,
                    ),
                    onTap: () => _service.call("+62274587333"),
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: ExpansionTile(
                title: Text(
                  'Police',
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Polda D I Yogyakarta',
                    ),
                    trailing: Icon(
                      FontAwesomeIcons.phoneAlt,
                      size: 18.0,
                    ),
                    onTap: () => _service.call("+62274886000"),
                  ),
                  ListTile(
                    title: Text(
                      'Polres Sleman',
                    ),
                    trailing: Icon(
                      FontAwesomeIcons.phoneAlt,
                      size: 18.0,
                    ),
                    onTap: () => _service.call("+62274868424"),
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: ExpansionTile(
              title: Text(
                'Taxi',
              ),
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Asa',
                  ),
                  trailing: Icon(
                    FontAwesomeIcons.phoneAlt,
                    size: 18.0,
                  ),
                  onTap: () => _service.call("+62274545545"),
                ),
                ListTile(
                  title: Text(
                    'Armada',
                  ),
                  trailing: Icon(
                    FontAwesomeIcons.phoneAlt,
                    size: 18.0,
                  ),
                  onTap: () => _service.call("+62274512787"),
                ),
                ListTile(
                  title: Text(
                    'Jas',
                  ),
                  trailing: Icon(
                    FontAwesomeIcons.phoneAlt,
                    size: 18.0,
                  ),
                  onTap: () => _service.call("+62274373737"),
                ),
                ListTile(
                  title: Text(
                    'Pataga',
                  ),
                  trailing: Icon(
                    FontAwesomeIcons.phoneAlt,
                    size: 18.0,
                  ),
                  onTap: () => _service.call("+62274371725"),
                ),
                ListTile(
                  title: Text(
                    'Vetri',
                  ),
                  trailing: Icon(
                    FontAwesomeIcons.phoneAlt,
                    size: 18.0,
                  ),
                  onTap: () => _service.call("+62274563551"),
                ),
              ],
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    var _homeBloc = HomeBloc();
    var state = _homeBloc.currentState as InHomeState;
    var contactStream = state.contacts;

    return DefaultTabController(
      length: 2,
      child: JoinmunScaffold(
        title: "Contacts",
        tabBar: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Tools.multiColors[Random().nextInt(4)],
          labelStyle: TextStyle(
            fontSize: 12,
          ),
          isScrollable: false,
          tabs: <Widget>[
            Tab(
              child: Text("Delegate Relations", style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(fontSize: 12),),
            ),
            Tab(
              child: Text("Emergency", style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(fontSize: 12),),
            )
          ],
        ),
        body: StreamBuilder(
            stream: contactStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                contacts = snapshot.data.documents
                    .map<Contact>((doc) => Contact.fromMap(doc.data))
                    .toList();
                return TabBarView(
                  children: <Widget>[
                    ContactList(
                      allContacts: contacts,
                      service: _service,
                    ),
                    emergencyContacts(context),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
