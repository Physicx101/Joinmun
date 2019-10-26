import 'dart:math';

import 'package:flutter/material.dart';
import 'package:joinmun_2019/home/index.dart';
import 'package:joinmun_2019/model/schedule.dart';
import 'package:joinmun_2019/model/sponsor.dart';
import 'package:joinmun_2019/schedule/schedule_list.dart';
import 'package:joinmun_2019/sponsor/sponsor_list.dart';
import 'package:joinmun_2019/universal/joinmun_scaffold.dart';
import 'package:joinmun_2019/utils/tools.dart';

class SponsorPage extends StatelessWidget {
  static const String routeName = "/sponsor";
  List<Sponsor> sponsors;

  @override
  Widget build(BuildContext context) {
    var _homeBloc = HomeBloc();
    var state = _homeBloc.currentState as InHomeState;
    var sponsorStream = state.sponsors;

    return DefaultTabController(
      length: 2,
      child: JoinmunScaffold(
        title: "Sponsors",
        tabBar: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Tools.multiColors[Random().nextInt(4)],
          labelStyle: TextStyle(
            fontSize: 12,
          ),
          isScrollable: false,
          tabs: <Widget>[
            Tab(
              child: Text(
                "Sponsors",
                style:
                    Theme.of(context).textTheme.subhead.copyWith(fontSize: 12),
              ),
            ),
            Tab(
              child: Text(
                "Media Partners",
                style:
                    Theme.of(context).textTheme.subhead.copyWith(fontSize: 12),
              ),
            ),
          ],
        ),
        body: StreamBuilder(
            stream: sponsorStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                sponsors = snapshot.data.documents
                    .map<Sponsor>((doc) => Sponsor.fromMap(doc.data))
                    .toList();
                return TabBarView(children: <Widget>[
                  sponsorTab(context, sponsors),
                  mediaPartnerTab(context, sponsors),
                ]);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}

Widget sponsorTab(context, List<Sponsor> sponsors) => SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  "Gold Sponsor",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            ..._createSponsorCard(
              context: context,
              sponsors: sponsors
                  .where((c) =>
                      c.sponsorType == "Sponsor" && c.sponsorGrade == "Gold")
                  .toList()
                    ..sort((a, b) => a.sponsorId.compareTo(b.sponsorId)),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  "Silver Sponsors",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Wrap(
              spacing: 20.0,
              runSpacing: 20.0,
              alignment: WrapAlignment.center,
              children: <Widget>[
                ..._createSponsorCard(
                  context: context,
                  sponsors: sponsors
                      .where((c) =>
                          c.sponsorType == "Sponsor" &&
                          c.sponsorGrade == "Silver")
                      .toList()
                        ..sort((a, b) => a.sponsorId.compareTo(b.sponsorId)),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  "Bronze Sponsors",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Wrap(
              spacing: 20.0,
              runSpacing: 20.0,
              alignment: WrapAlignment.center,
              children: <Widget>[
                ..._createSponsorCard(
                  context: context,
                  sponsors: sponsors
                      .where((c) =>
                          c.sponsorType == "Sponsor" &&
                          c.sponsorGrade == "Bronze")
                      .toList()
                        ..sort((a, b) => a.sponsorId.compareTo(b.sponsorId)),
                ),
              ],
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );

Widget mediaPartnerTab(context, List<Sponsor> sponsors) => SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  "Diamond Media Partner",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            ..._createSponsorCard(
              context: context,
              sponsors: sponsors
                  .where((c) =>
                      c.sponsorType == "Media" && c.sponsorGrade == "Gold")
                  .toList()
                    ..sort((a, b) => a.sponsorId.compareTo(b.sponsorId)),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  "Gold Media Partners",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Wrap(
              spacing: 20.0,
              runSpacing: 20.0,
              alignment: WrapAlignment.center,
              children: <Widget>[
                ..._createSponsorCard(
                  context: context,
                  sponsors: sponsors
                      .where((c) =>
                          c.sponsorType == "Media" &&
                          c.sponsorGrade == "Silver")
                      .toList()
                        ..sort((a, b) => a.sponsorId.compareTo(b.sponsorId)),
                ),
              ],
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );

List<Widget> _createSponsorCard(
    {BuildContext context, Iterable<Sponsor> sponsors}) {
  List<Widget> widgets = [];
  final List<Sponsor> listSponsors = sponsors.toList();
  for (var i = 0; i < listSponsors.length; i++) {
    Sponsor sponsor = listSponsors[i];
    Widget sponsorCard = SponsorList(
      sponsor: sponsor,
    );
    widgets.add(sponsorCard);
  }
  return widgets;
}
