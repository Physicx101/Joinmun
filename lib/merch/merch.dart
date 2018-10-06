import 'package:flutter/material.dart';
import 'package:joinmun/layout_type.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';
import 'package:joinmun/home/home.dart';

class MerchHeader implements SliverPersistentHeaderDelegate {
  MerchHeader({
    this.layoutGroup,
    this.onLayoutToggle,
    this.minExtent,
    this.maxExtent,
  });
  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;
  double maxExtent;
  double minExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/bg.jpg',
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black54,
              ],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        Positioned(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Get these merch at:',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: 'GoogleSans'),
              ),
              SocialMediaButton(
                backgroundImage: "assets/ic_fb_white.png",
                size: 32.0,
                onPressed: () {
                  // TODO:
                },
              ),
              SocialMediaButton(
                backgroundImage: "assets/ic_ig_white.png",
                size: 32.0,
                onPressed: () {
                  // TODO:
                },
              ),
              SocialMediaButton(
                backgroundImage: "assets/ic_twitter_white.png",
                size: 32.0,
                onPressed: () {
                  // TODO:
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
}

class MerchPage extends StatelessWidget implements HasLayoutGroup {
  MerchPage({Key key, this.layoutGroup, this.onLayoutToggle}) : super(key: key);
  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  final List<String> assetNames = [
    'assets/totebag.png',
    'assets/trump.png',
    'assets/shirt.png',
    'assets/shirt2.png',
    'assets/shirt3.png',
    'assets/shirt4.png',
  ];

  final List<String> productNames = [
    'JOINMUN Totebag',
    'Trump Totebag',
    'JOINMUN T-Shirt',
    'MUN Experience',
    'Lunch Not Launch',
    'Life of Kim',
  ];

  final List<String> productPrice = [
    'Rp 55.000',
    'Rp 55.000',
    'Rp 80.000',
    'Rp 80.000',
    'Rp 80.000',
    'Rp 80.000',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _scrollView(context),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  Widget _scrollView(BuildContext context) {
    final EdgeInsets mediaPadding = MediaQuery.of(context).padding;
    double height = MediaQuery.of(context).size.height;
    // Use LayoutBuilder to get the hero header size while keeping the image aspect-ratio
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: false,
            delegate: MerchHeader(
              layoutGroup: layoutGroup,
              onLayoutToggle: onLayoutToggle,
              minExtent: 150.0,
              maxExtent: 230.0,
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              childAspectRatio: 0.75,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8.0),
                  child: new Card(
                    color: Colors.white,
                    elevation: 0.0,
                    child: new Stack(
                      children: <Widget>[
                        new Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Align(
                              alignment: Alignment.centerRight,
                              child: new Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new Text(
                                    productPrice[index],
                                    style: new TextStyle(
                                        fontFamily: 'LemonMilk',
                                        fontSize: 14.0,
                                        color: Theme.of(context).accentColor),
                                  ),
                                ),
                              ),
                            ),
                            new Image.asset(
                              assetNames[index],
                              fit: BoxFit.contain,
                              height: 150.0,
                            ),
                            new Padding(
                              padding: mediaPadding,
                              child: new Text(
                                productNames[index],
                                style: new TextStyle(
                                    fontFamily: 'LemonMilk',
                                    fontSize: 14.0,
                                    color: Theme.of(context).accentColor),
                              ),
                            ),
                            new SizedBox(
                              height: 8.0
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: assetNames.length,
            ),
          ),
        ],
      ),
    );
  }

  EdgeInsets _edgeInsetsForIndex(int index) {
    if (index % 2 == 0) {
      return EdgeInsets.only(top: 4.0, left: 8.0, right: 4.0, bottom: 4.0);
    } else {
      return EdgeInsets.only(top: 4.0, left: 4.0, right: 8.0, bottom: 4.0);
    }
  }
}
