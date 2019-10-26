import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joinmun_2019/chair/chair_page.dart';
import 'package:joinmun_2019/config/index.dart';
import 'package:joinmun_2019/contact/contact_page.dart';
import 'package:joinmun_2019/event/event_page.dart';
import 'package:joinmun_2019/home/home_widgets/remarks_detail.dart';
import 'package:joinmun_2019/jointimes/jointimes_page.dart';
import 'package:joinmun_2019/merch/merch_page.dart';
import 'package:joinmun_2019/place/place_page.dart';
import 'package:joinmun_2019/schedule/schedule_page.dart';
import 'package:joinmun_2019/speaker/speaker_page.dart';
import 'package:joinmun_2019/sponsor/sponsor_page.dart';
import 'package:joinmun_2019/universal/image_card.dart';
import 'package:joinmun_2019/utils/joinmun.dart';
import 'package:joinmun_2019/utils/tools.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeFront extends StatelessWidget {
  List<Widget> joinmunRemarks(context) => [
        Text(
          Joinmun.remarksText,
          style: Theme.of(context).textTheme.headline,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RemarksDetail(
                  name: "Salu",
                ),
              ),
            );
          },
          child: Ink(
            decoration: BoxDecoration(
              color: ConfigBloc().darkModeOn
                  ? Tools.hexToColor("#1f2124")
                  : Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: !ConfigBloc().darkModeOn
                  ? [
                      BoxShadow(
                        color: Colors.grey[200],
                        blurRadius: 10,
                        spreadRadius: 5,
                      )
                    ]
                  : null,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              Joinmun.remarks_salu_name,
                              style: Theme.of(context).textTheme.title,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 5,
                              color: Tools.hexToColor(Joinmun.joinmun_color_7),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          Joinmun.remarks_salu_role,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          Joinmun.remarks_salu_faculty,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          Joinmun.remarks_ugm,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.expand(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    child: Hero(
                      tag: "Salu",
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://firebasestorage.googleapis.com/v0/b/joinmun-864f5.appspot.com/o/salu_image.JPG?alt=media&token=45c87c12-26ce-4d2a-9d97-a776159d6286",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RemarksDetail(
                  name: "Kayla",
                ),
              ),
            );
          },
          child: Ink(
            decoration: BoxDecoration(
              color: ConfigBloc().darkModeOn
                  ? Tools.hexToColor("#1f2124")
                  : Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: !ConfigBloc().darkModeOn
                  ? [
                      BoxShadow(
                        color: Colors.grey[200],
                        blurRadius: 10,
                        spreadRadius: 5,
                      )
                    ]
                  : null,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints.expand(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    child: Hero(
                      tag: "Kayla",
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://firebasestorage.googleapis.com/v0/b/joinmun-864f5.appspot.com/o/kayla_image.JPG?alt=media&token=70c24c60-2a95-4c9a-ab9f-4b94a88764f5",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              Joinmun.remarks_kayla_name,
                              style: Theme.of(context).textTheme.title,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 5,
                              color: Tools.hexToColor(Joinmun.joinmun_color_3),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          Joinmun.remarks_kayla_role,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          Joinmun.remarks_kayla_faculty,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          Joinmun.remarks_ugm,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ];

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget newActions(context) => Wrap(
        alignment: WrapAlignment.center,
        spacing: 20.0,
        runSpacing: 20.0,
        children: <Widget>[
          MenuCard(
            icon: FontAwesomeIcons.newspaper,
            color: Tools.hexToColor(Joinmun.joinmun_color_3),
            title: Joinmun.jointimes_text,
            onPressed: () =>
                Navigator.pushNamed(context, JointimesPage.routeName),
          ),
          MenuCard(
            icon: FontAwesomeIcons.clock,
            color: Tools.hexToColor(Joinmun.joinmun_color_7),
            title: Joinmun.schedule_text,
            onPressed: () =>
                Navigator.pushNamed(context, SchedulePage.routeName),
          ),
          MenuCard(
            icon: FontAwesomeIcons.calendar,
            color: Tools.hexToColor(Joinmun.joinmun_color_3),
            title: Joinmun.events_text,
            onPressed: () => Navigator.pushNamed(context, EventPage.routeName),
          ),
          MenuCard(
            icon: FontAwesomeIcons.userFriends,
            color: Tools.hexToColor(Joinmun.joinmun_color_7),
            title: Joinmun.speakers_text,
            onPressed: () =>
                Navigator.pushNamed(context, SpeakerPage.routeName),
          ),
          MenuCard(
            icon: FontAwesomeIcons.chair,
            color: Tools.hexToColor(Joinmun.joinmun_color_3),
            title: Joinmun.chairs_text,
            onPressed: () => Navigator.pushNamed(context, ChairPage.routeName),
          ),
          MenuCard(
            icon: FontAwesomeIcons.mapMarkedAlt,
            color: Tools.hexToColor(Joinmun.joinmun_color_7),
            title: Joinmun.places_text,
            onPressed: () => Navigator.pushNamed(context, PlacePage.routeName),
          ),
          MenuCard(
            icon: FontAwesomeIcons.tshirt,
            color: Tools.hexToColor(Joinmun.joinmun_color_3),
            title: Joinmun.merch_text,
            onPressed: () => Navigator.pushNamed(context, MerchPage.routeName),
          ),
          MenuCard(
            icon: FontAwesomeIcons.addressBook,
            color: Tools.hexToColor(Joinmun.joinmun_color_7),
            title: Joinmun.contacts_text,
            onPressed: () =>
                Navigator.pushNamed(context, ContactPage.routeName),
          ),
           MenuCard(
            icon: FontAwesomeIcons.dollarSign,
            color: Tools.hexToColor(Joinmun.joinmun_color_3),
            title: Joinmun.sponsors_text,
            onPressed: () =>
                Navigator.pushNamed(context, SponsorPage.routeName),
          ),
        ],
      );

  Widget socialActions(context) => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.facebookF),
              color: Tools.hexToColor(Joinmun.joinmun_color_7),
              onPressed: () async {
                await _launchURL("https://facebook.com/JOINMUN");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.twitter),
              color: Tools.hexToColor(Joinmun.joinmun_color_3),
              onPressed: () async {
                await _launchURL("https://twitter.com/joinmun");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.instagram),
              color: Tools.hexToColor(Joinmun.joinmun_color_7),
              onPressed: () async {
                _launchURL("https://instagram.com/joinmun.2019");
              },
            ),
          ],
        ),
      );

  Widget sponsorActions(context) => Wrap(
        alignment: WrapAlignment.center,
        spacing: 15.0,
        runSpacing: 15.0,
        children: <Widget>[
          SponsorCard(
            imgUrl: 'assets/images/sponsors/gold/twc.png',
            sponsorType: "Gold",
          ),
          SponsorCard(
            imgUrl: 'assets/images/sponsors/silver/3m.png',
            sponsorType: "Silver",
          ),
          SponsorCard(
            imgUrl: 'assets/images/sponsors/silver/bukit-asam.png',
            sponsorType: "Silver",
          ),
          SponsorCard(
            imgUrl: 'assets/images/sponsors/silver/post-it.png',
            sponsorType: "Silver",
          ),
          SponsorCard(
            imgUrl: 'assets/images/sponsors/silver/pp-ok.png',
            sponsorType: "Silver",
          ),
          SponsorCard(
            imgUrl: 'assets/images/sponsors/silver/telkomsel.jpg',
            sponsorType: "Silver",
          ),
          SponsorCard(
            imgUrl: 'assets/images/sponsors/silver/pupuk.png',
            sponsorType: "Silver",
          ),
          SponsorCard(
            imgUrl: 'assets/images/sponsors/bronze/pupuk-iskandar.jpg',
            sponsorType: "Bronze",
          ),
          SponsorCard(
            imgUrl: 'assets/images/sponsors/bronze/lensajogja.jpg',
            sponsorType: "Bronze",
          ),
          SponsorCard(
            imgUrl: 'assets/images/sponsors/bronze/presisi.png',
            sponsorType: "Bronze",
          ),
          SponsorCard(
            imgUrl: 'assets/images/sponsors/bronze/bni.png',
            sponsorType: "Bronze",
          ),
          SponsorCard(
            imgUrl: 'assets/images/sponsors/bronze/pp-urban.png',
            sponsorType: "Bronze",
          ),
          SponsorCard(
            imgUrl: 'assets/images/sponsors/bronze/sintesis.jpeg',
            sponsorType: "Bronze",
          ),
        ],
      );

  Widget medpartActions(context) => Wrap(
        alignment: WrapAlignment.center,
        spacing: 15.0,
        runSpacing: 15.0,
        children: <Widget>[
          MedpartCard(
            imgUrl: 'assets/images/partners/rtv.png',
            medpartType: "Diamond",
          ),
          MedpartCard(
            imgUrl: 'assets/images/partners/radioq.png',
            medpartType: "Gold",
          ),
          MedpartCard(
            imgUrl: 'assets/images/partners/gnfi.png',
            medpartType: "Gold",
          ),
          MedpartCard(
            imgUrl: 'assets/images/partners/harian-jogja.jpeg',
            medpartType: "Gold",
          ),
          MedpartCard(
            imgUrl: 'assets/images/partners/iradio.png',
            medpartType: "Gold",
          ),
          MedpartCard(
            imgUrl: 'assets/images/partners/koran-jakarta.png',
            medpartType: "Gold",
          ),
          MedpartCard(
            imgUrl: 'assets/images/partners/jogja-family.png',
            medpartType: "Gold",
          ),
          MedpartCard(
            imgUrl: 'assets/images/partners/swaragama.png',
            medpartType: "Gold",
          ),
          MedpartCard(
            imgUrl: 'assets/images/partners/renesia.png',
            medpartType: "Gold",
          ),
          MedpartCard(
            imgUrl: 'assets/images/partners/rbtv.png',
            medpartType: "Gold",
          ),
          MedpartCard(
            imgUrl: 'assets/images/partners/tribun-jogja.png',
            medpartType: "Gold",
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ImageCard(img: Joinmun.banner_joinmun),
            SizedBox(
              height: 20,
            ),
            Text(
              Joinmun.welcomeText,
              style: Theme.of(context).textTheme.headline,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            newActions(context),
            SizedBox(
              height: 20,
            ),
            ...joinmunRemarks(context),
            SizedBox(
              height: 20,
            ),
            /*Text(
              Joinmun.sponsorText,
              style: Theme.of(context).textTheme.headline,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            sponsorActions(context),
            SizedBox(
              height: 20,
            ),
           Text(
              Joinmun.medpartText,
              style: Theme.of(context).textTheme.headline,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            medpartActions(context),
            SizedBox(
              height: 20,
            ),*/
            socialActions(context),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String title;
  final Color color;

  const MenuCard({Key key, this.onPressed, this.icon, this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onPressed,
      child: Ink(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          color: ConfigBloc().darkModeOn
              ? Tools.hexToColor("#1f2124")
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: !ConfigBloc().darkModeOn
              ? [
                  BoxShadow(
                    color: Colors.grey[200],
                    blurRadius: 10,
                    spreadRadius: 5,
                  )
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: color,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.title.copyWith(
                    fontSize: 11,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class SponsorCard extends StatelessWidget {
  final String imgUrl;
  final String sponsorType;

  SponsorCard({Key key, this.imgUrl, this.sponsorType}) : super(key: key);

  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    switch (sponsorType) {
      case "Gold":
        this.width = MediaQuery.of(context).size.width * 0.9;
        this.height = this.width * 0.5;
        break;
      case "Silver":
        this.width = MediaQuery.of(context).size.width * 0.42;
        this.height = this.width * 0.5;
        break;
      case "Bronze":
        this.width = MediaQuery.of(context).size.width * 0.26;
        this.height = this.width * 0.5;
        break;
      default:
        this.width = MediaQuery.of(context).size.width * 1.0;
        this.height = this.width * 0.5;
        break;
    }
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {},
      child: Ink(
        height: this.height,
        width: this.width,
        decoration: BoxDecoration(
          color: ConfigBloc().darkModeOn
              ? Tools.hexToColor("#1f2124")
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: !ConfigBloc().darkModeOn
              ? [
                  BoxShadow(
                    color: Colors.grey[200],
                    blurRadius: 10,
                    spreadRadius: 5,
                  )
                ]
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            imgUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class MedpartCard extends StatelessWidget {
  final String imgUrl;
  final String medpartType;

  MedpartCard({Key key, this.imgUrl, this.medpartType}) : super(key: key);

  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    switch (medpartType) {
      case "Diamond":
        this.width = MediaQuery.of(context).size.width * 0.9;
        this.height = this.width * 0.5;
        break;
      case "Platinum":
        this.width = MediaQuery.of(context).size.width * 0.6;
        this.height = this.width * 0.5;
        break;
      case "Gold":
        this.width = MediaQuery.of(context).size.width * 0.42;
        this.height = this.width * 0.5;
        break;
      case "Silver":
        this.width = MediaQuery.of(context).size.width * 0.26;
        this.height = this.width * 0.5;
        break;
      case "Bronze":
        this.width = MediaQuery.of(context).size.width * 0.18;
        this.height = this.width * 0.5;
        break;
      default:
        this.width = MediaQuery.of(context).size.width * 1.0;
        this.height = this.width * 0.5;
        break;
    }
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {},
      child: Ink(
        height: this.height,
        width: this.width,
        decoration: BoxDecoration(
          color: ConfigBloc().darkModeOn
              ? Tools.hexToColor("#1f2124")
              : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: !ConfigBloc().darkModeOn
              ? [
                  BoxShadow(
                    color: Colors.grey[200],
                    blurRadius: 10,
                    spreadRadius: 5,
                  )
                ]
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            imgUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
