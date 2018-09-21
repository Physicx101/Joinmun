import 'dart:ui';

import 'package:flutter/material.dart';




final TextStyle titleStyle = const TextStyle(
    fontSize: 24.0, fontWeight: FontWeight.w500, fontFamily: 'LemonMilk');

final TextStyle nameStyle = const TextStyle(
    fontWeight: FontWeight.w500, fontSize: 16.0, fontFamily: 'CenturyGothic');

final TextStyle descStyle = const TextStyle(
    fontSize: 14.0,
    fontFamily: 'CenturyGothic',
    fontWeight: FontWeight.w500,
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
            decoration: new BoxDecoration(color: Colors.black.withOpacity(0.5)),
            child: new Stack(
              children: <Widget>[
                Center(
                  child: new Text('Welcome to JOINMUN 2018',
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.5,
                          fontFamily: 'LemonMilk',
                          color: Colors.white)),
                ),
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
                    child: new Image.asset('assets/fakhri.jpg',
                    height: 230.0,
                    fit: BoxFit.cover,),
                  )
                ),
                new Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new Text(
                        "Welcoming Remarks",
                        style: titleStyle,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ),
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
                  'assets/fakhri.jpg',
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
                  new Text(
                    "Welcoming Remarks",
                    style: titleStyle,
                  ),
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
