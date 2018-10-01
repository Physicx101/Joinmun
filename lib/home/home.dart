import 'dart:ui';

import 'package:flutter/material.dart';




final TextStyle titleStyle = const TextStyle(
    fontSize: 24.0, fontWeight: FontWeight.w500, fontFamily: 'LemonMilk');

final TextStyle nameStyle = const TextStyle(
    fontWeight: FontWeight.w700, fontSize: 18.0, fontFamily: 'GoogleSans');

final TextStyle descStyle = const TextStyle(
    fontSize: 14.0,
    fontFamily: 'GoogleSans',
    fontWeight: FontWeight.w500,
    color: Colors.black54,
    height: 1.95);

class HomeView extends StatelessWidget {
  Size deviceSize;

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

  Widget _welcomingRemarks(BuildContext context) => Container(
      child: new GestureDetector(
        onTap: () => openRemarks(context),
        child: new Card(
          elevation: 0.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Hero(
                    tag: 'welcome',
                    child: new ClipRRect(
                      borderRadius: new BorderRadius.circular(8.0),
                      child: new Image.asset('assets/fakhri.png',
                        height: 230.0,
                        fit: BoxFit.cover,),
                    )
                ),
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new SizedBox(
                        height: 8.0,
                      ),
                      new Text(
                        "Muhammad Fakhri Abdurrahman",
                        style: nameStyle,
                      ),
                      const Padding(padding: const EdgeInsets.only(top: 8.0)),
                      new Text(
                        """A very warm welcome to all of you, delegates!                  
Your presence in this year’s Jogjakarta International Model United Nations will not go waste for sure. The committee and I are excited to welcome you and give you the best experience in MUN and in Yogyakarta. All our services, including this mobile app, are specifically designed to ensure your comfort and convenience throughout the conference. This year, we will challenge all of you to delightful debates and negotiations while also providing you with the best that Yogyakarta has to offer. Make sure you enjoy the best of JOINMUN and Yogyakarta while you are here and don’t forget to have loads of fun.
Warm Regards,
Muhammad Fakhri Abdurrahman
President of Jogja International Model United Nations 2018
                  """,
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
      ));

  void openRemarks(BuildContext context) {
    Navigator.push(
      context,
      new MaterialPageRoute<Null>(
        settings: const RouteSettings(name: 'remarks'),
        builder: (BuildContext context) {
          return new Theme(
            data: Theme.of(context),
            child: new RemarksPage(),
          );
        },
      ),
    );
  }

  Widget _welcomingRemarks2(BuildContext context) => Container(
      child: new GestureDetector(
        onTap: () => openRemarks2(context),
        child: new Card(
          elevation: 0.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Hero(
                    tag: 'welcome2',
                    child: new ClipRRect(
                      borderRadius: new BorderRadius.circular(8.0),
                      child: new Image.asset('assets/carol.jpg',
                        height: 230.0,
                        fit: BoxFit.cover,),
                    )
                ),
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new SizedBox(
                        height: 8.0,
                      ),
                      new Text(
                        "Caroline Fortuna Easterlita Surya",
                        style: nameStyle,
                      ),
                      const Padding(padding: const EdgeInsets.only(top: 8.0)),
                      new Text(
                        """Dear delegates,
I’d like to congratulate you for taking part in JOINMUN 2018 as you have decided to surprise yourself on how much you can do with the capability that you have as an individual with great mind!
JOINMUN 2018 represents determination of the youth to help the international community in raising awareness of the most crucial issue that we are facing nowadays. When we came up with the Grand Theme of our conference, I recognized that states have the highest authority in the global affairs, sovereignty has a big role on creating issues within our global sphere. For decades, the international community gradually tries to make the world a better place to live for mankind. Nonetheless, anarchy and violence happens at places around the globe. Hence, JOINMUN 2018 is the platform for you to help the world leaders to resolve global issues, as each of you are a part of the international community.


Great things happen when there is a gathering of great minds. I wish you to value this gathering of great minds by enjoying our set of events. Good luck delegates!
Sincerely,
Caroline Fortuna Easterlita Surya
Secretary-General of Jogja International Model United Nations 2018

                  """,
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
      ));

  void openRemarks2(BuildContext context) {
    Navigator.push(
      context,
      new MaterialPageRoute<Null>(
        settings: const RouteSettings(name: 'remarks'),
        builder: (BuildContext context) {
          return new Theme(
            data: Theme.of(context),
            child: new RemarksPage2(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var textTheme = Theme.of(context).textTheme;

    final descriptionTextStyle = theme.textTheme.body1.copyWith(
      height: 1.95,
    );

    return new Scaffold(
      body: new SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _homeHeader(),
            _welcomingRemarks(context),
            _welcomingRemarks2(context),
            new SizedBox(
              height: 8.0,
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Social Media',
                    style:
                    new TextStyle(fontFamily: 'LemonMilk', fontSize: 16.0),
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
                              size: 60.0,
                              onPressed: () {
                                // TODO:
                              },
                            ),
                            new SocialMediaButton(
                              backgroundImage: "assets/ic_ig.png",
                              size: 60.0,
                              onPressed: () {
                                // TODO:
                              },
                            ),
                            new SocialMediaButton(
                              backgroundImage: "assets/ic_twitter.png",
                              size: 60.0,
                              onPressed: () {
                                // TODO:
                              },
                            )
                          ]),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RemarksPage extends StatelessWidget {
  RemarksPage();

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
                tag: 'welcome',
                child: new Image.asset(
                  'assets/fakhri.png',
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
                    "Muhammad Fakhri Abdurrahman",
                    style: nameStyle,
                  ),
                  new SizedBox(
                    height: 8.0,
                  ),
                  new Text("""A very warm welcome to all of you, delegates!
                                  
Your presence in this year’s Jogjakarta International Model United Nations will not go waste for sure. The committee and I are excited to welcome you and give you the best experience in MUN and in Yogyakarta. All our services, including this mobile app, are specifically designed to ensure your comfort and convenience throughout the conference. This year, we will challenge all of you to delightful debates and negotiations while also providing you with the best that Yogyakarta has to offer. Make sure you enjoy the best of JOINMUN and Yogyakarta while you are here and don’t forget to have loads of fun.  
               
Warm Regards,
Muhammad Fakhri Abdurrahman
President of Jogja International Model United Nations 2018
                    """, style: descStyle),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RemarksPage2 extends StatelessWidget {
  RemarksPage2();

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
                tag: 'welcome2',
                child: new Image.asset(
                  'assets/carol.jpg',
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
                    "Caroline Fortuna Easterlita Surya",
                    style: nameStyle,
                  ),
                  new SizedBox(
                    height: 8.0,
                  ),
                  new Text("""Dear delegates,
I’d like to congratulate you for taking part in JOINMUN 2018 as you have decided to surprise yourself on how much you can do with the capability that you have as an individual with great mind!
JOINMUN 2018 represents determination of the youth to help the international community in raising awareness of the most crucial issue that we are facing nowadays. When we came up with the Grand Theme of our conference, I recognized that states have the highest authority in the global affairs, sovereignty has a big role on creating issues within our global sphere. For decades, the international community gradually tries to make the world a better place to live for mankind. Nonetheless, anarchy and violence happens at places around the globe. Hence, JOINMUN 2018 is the platform for you to help the world leaders to resolve global issues, as each of you are a part of the international community.


Great things happen when there is a gathering of great minds. I wish you to value this gathering of great minds by enjoying our set of events. Good luck delegates!
Sincerely,
Caroline Fortuna Easterlita Surya
Secretary-General of Jogja International Model United Nations 2018

                  """, style: descStyle),
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