import 'package:flutter/material.dart';
import 'package:joinmun/layout_type.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';
import 'package:joinmun/home/home.dart';
import 'package:url_launcher/url_launcher.dart';

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

  final String ig = 'https://www.instagram.com/joinmun.store/';
  final String line = 'https://line.me/R/ti/p/@kyr5219e';

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/bg.jpg',
          fit: BoxFit.cover,
          color: Theme.of(context).primaryColor,
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Get them now at:',
                style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SocialMediaButton(
                    backgroundImage: 'assets/ic_ig.png',
                    size: 72.0,
                    onPressed: () async {
                      if (await canLaunch(ig)) {
                        await launch(ig);
                      }
                    },
                  ),
                  SocialMediaButton(
                    backgroundImage: 'assets/ic_line_white.png',
                    size: 72.0,
                    onPressed: () async {
                      if (await canLaunch(line)) {
                        await launch(line);
                      }
                    },
                  ),
                ],
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
    var theme = Theme.of(context);
    return Scaffold(
      body: _scrollView(context),
      backgroundColor: Colors.black12,
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
              maxExtent: 200.0,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return new Card(
                    color: Colors.white,
                    elevation: 0.0,
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                        ),
                        new Image.asset(
                          assetNames[index],
                          fit: BoxFit.contain,
                          height: 145.0,
                        ),
                        new Padding(
                          padding: mediaPadding,
                          child: new Text(
                            productNames[index],
                            style: new TextStyle(
                                fontFamily: 'LemonMilk',
                                fontSize: 15.0,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: assetNames.length,
              ),
            ),
          )
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
