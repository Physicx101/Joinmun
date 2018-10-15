import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

final TextStyle titleStyle = const TextStyle(
    fontSize: 24.0, fontWeight: FontWeight.w500, fontFamily: 'LemonMilk');

final TextStyle nameStyle = const TextStyle(
    fontWeight: FontWeight.w700, fontSize: 16.0, fontFamily: 'Montserrat');

final TextStyle descStyle = const TextStyle(
    fontSize: 14.0,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
    color: Colors.black54,
    height: 1.5);

class Remark {
  final String name;
  final String image;
  final String desc;
  final String shortDesc;

  const Remark({this.name, this.image, this.desc, this.shortDesc});
}

const List<Remark> kRemarkLists = const <Remark>[
  const Remark(
      name: "Muhammad Fakhri Abdurrahman",
      image: "assets/fakhri.png",
      shortDesc:
          'A very warm welcome to all of you, delegates! Your presence in this year’s Jogjakarta International Model United Nations will not go waste for sure. The committee and I are excited to welcome you and give you the best experience in MUN and in Yogyakarta. All our services, including this mobile app, are specifically designed to ensure your comfort and convenience throughout the conference. This year, we will challenge all of you to delightful debates and negotiations while also providing you with the best that Yogyakarta has to offer. Make sure you enjoy the best of JOINMUN and Yogyakarta while you are here and don’t forget to have loads of fun.',
      desc: """A very warm welcome to all of you, delegates!

Your presence in this year’s Jogjakarta International Model United Nations will not go waste for sure. The committee and I are excited to welcome you and give you the best experience in MUN and in Yogyakarta. All our services, including this mobile app, are specifically designed to ensure your comfort and convenience throughout the conference. This year, we will challenge all of you to delightful debates and negotiations while also providing you with the best that Yogyakarta has to offer. Make sure you enjoy the best of JOINMUN and Yogyakarta while you are here and don’t forget to have loads of fun.

Warm Regards,
Muhammad Fakhri Abdurrahman
President of Jogja International Model United Nations 2018
                  """),
  const Remark(
      name: "Caroline Fortuna Easterlita Surya",
      image: "assets/carol.jpg",
      shortDesc:
          'Dear delegates, I’d like to congratulate you for taking part in JOINMUN 2018 as you have decided to surprise yourself on how much you can do with the capability that you have as an individual with great mind! JOINMUN 2018 represents determination of the youth to',
      desc: """Dear delegates,
I’d like to congratulate you for taking part in JOINMUN 2018 as you have decided to surprise yourself on how much you can do with the capability that you have as an individual with great mind!
JOINMUN 2018 represents determination of the youth to help the international community in raising awareness of the most crucial issue that we are facing nowadays. When we came up with the Grand Theme of our conference, I recognized that states have the highest authority in the global affairs, sovereignty has a big role on creating issues within our global sphere. For decades, the international community gradually tries to make the world a better place to live for mankind. Nonetheless, anarchy and violence happens at places around the globe. Hence, JOINMUN 2018 is the platform for you to help the world leaders to resolve global issues, as each of you are a part of the international community.

Great things happen when there is a gathering of great minds. I wish you to value this gathering of great minds by enjoying our set of events. Good luck delegates!

Sincerely,
Caroline Fortuna Easterlita Surya
Secretary-General of Jogja International Model United Nations 2018

                  """)
];

class HomePage extends StatelessWidget {
  final String fb = 'https://www.facebook.com/JOINMUN/';
  final String ig = 'https://www.instagram.com/joinmun2018/';
  final String twitter = 'https://twitter.com/joinmun?lang=en';

  Widget _homeHeader() => Container(
        constraints: new BoxConstraints.expand(
          height: 200.0,
        ),
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: new BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: new Container(
            decoration: new BoxDecoration(color: Colors.white.withOpacity(0.5)),
            child: new Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: new Container(
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage('assets/banner.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Widget _buildSocial() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Social Media',
            style: new TextStyle(fontFamily: 'LemonMilk', fontSize: 18.0),
          ),
        ),
        Card(
            elevation: 0.0,
            child: new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new SocialMediaButton(
                      backgroundImage: "assets/ic_fb.png",
                      size: 40.0,
                      onPressed: () async {
                        if (await canLaunch(fb)) {
                          await launch(fb);
                        }
                      },
                    ),
                    new SocialMediaButton(
                      backgroundImage: "assets/ic_ig.png",
                      size: 40.0,
                      onPressed: () async {
                        if (await canLaunch(ig)) {
                          await launch(ig);
                        }
                      },
                    ),
                    new SocialMediaButton(
                      backgroundImage: "assets/ic_twitter.png",
                      size: 40.0,
                      onPressed: () async {
                        if (await canLaunch(twitter)) {
                          await launch(twitter);
                        }
                      },
                    )
                  ]),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final EdgeInsets mediaPadding = MediaQuery.of(context).padding;
    final EdgeInsets padding =
        new EdgeInsets.only(top: 8.0, left: 0.0, right: 0.0, bottom: 8.0);
    final theme = Theme.of(context);
    var textTheme = Theme.of(context).textTheme;

    final descriptionTextStyle = theme.textTheme.body1.copyWith(
      height: 1.95,
    );

    return new Scaffold(
      backgroundColor: Colors.white,
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
              expandedHeight: 220.0,
              flexibleSpace: FlexibleSpaceBar(
                background: _homeHeader(),
              )),
          new SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0),
              child: Text(
                'Welcoming Remarks',
                style: new TextStyle(fontFamily: 'LemonMilk', fontSize: 18.0),
              ),
            ),
          ),
          new SliverPadding(
            padding: mediaPadding,
            sliver: SliverFixedExtentList(
              itemExtent: 360.0,
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final Remark remark = kRemarkLists[index];
                  return new RemarksCard(
                    remark,
                  );
                },
                childCount: kRemarkLists.length,
              ),
            ),
          ),
          new SliverToBoxAdapter(
            child: _buildSocial(),
          ),
        ],
      ),
    );
  }
}

class RemarksCard extends StatelessWidget {
  RemarksCard(this.remark);

  final Remark remark;
  @override
  Widget build(BuildContext context) {
    final EdgeInsets mediaPadding = MediaQuery.of(context).padding;
    return new GestureDetector(
      onTap: () => openRemarksPage(context, remark),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Card(
          elevation: 0.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Hero(
                    tag: remark.image,
                    child: new ClipRRect(
                      borderRadius: new BorderRadius.circular(8.0),
                      child: new Image.asset(
                        remark.image,
                        height: 188.0,
                        fit: BoxFit.cover,
                      ),
                    )),
                new SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Text(
                        remark.name,
                        style: nameStyle,
                      ),
                      new Text(
                        remark.shortDesc,
                        style: descStyle,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void openRemarksPage(BuildContext context, Remark remark) {
    Navigator.push(
      context,
      new MaterialPageRoute<Null>(
        settings: const RouteSettings(name: 'remarks'),
        builder: (BuildContext context) {
          return new Theme(
            data: Theme.of(context),
            child: new RemarksPage(remark),
          );
        },
      ),
    );
  }
}

class RemarksPage extends StatelessWidget {
  RemarksPage(this.remark);

  final Remark remark;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final descriptionTextStyle = theme.textTheme.body1.copyWith(
      fontFamily: 'CenturyGothic',
      height: 1.95,
    );

    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: 250.0,
            backgroundColor: Colors.transparent,
            flexibleSpace: new FlexibleSpaceBar(
              background: new Hero(
                tag: remark.image,
                child: new Image.asset(
                  remark.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          new SliverToBoxAdapter(
            child: new Padding(
              padding: new EdgeInsets.all(16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new SizedBox(
                    height: 8.0,
                  ),
                  new Text(
                    remark.name,
                    style: nameStyle,
                  ),
                  new SizedBox(
                    height: 8.0,
                  ),
                  new Text(remark.desc, style: descStyle),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  final String backgroundImage;
  final double size;
  final VoidCallback onPressed;

  SocialMediaButton({
    this.backgroundImage,
    this.size,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return new Material(
        elevation: 0.0,
        shape: CircleBorder(),
        color: Colors.transparent,
        child: Ink.image(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
          width: size,
          height: size,
          child: InkWell(
            onTap: onPressed,
            child: null,
          ),
        ));
  }
}
