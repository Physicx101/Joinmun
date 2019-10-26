import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joinmun_2019/config/index.dart';
import 'package:joinmun_2019/home/home_bloc.dart';
import 'package:joinmun_2019/home/home_state.dart';
import 'package:joinmun_2019/merch/merch_detail.dart';
import 'package:joinmun_2019/universal/image_card.dart';
import 'package:joinmun_2019/universal/joinmun_scaffold.dart';
import 'package:joinmun_2019/utils/joinmun.dart';
import 'package:joinmun_2019/utils/tools.dart';
import 'package:url_launcher/url_launcher.dart';

class MerchPage extends StatelessWidget {
  static const String routeName = "/merch";

  @override
  Widget build(BuildContext context) {
    var _homeBloc = HomeBloc();
    var state = _homeBloc.currentState as InHomeState;
    var merch = state.merchData.merch;

    return JoinmunScaffold(
        title: "Merchandise",
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 8.0),
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
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Get them now at:',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Avenir',
                                fontWeight: FontWeight.w700),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              IconButton(
                                iconSize: 36.0,
                                icon: Icon(FontAwesomeIcons.instagram),
                                onPressed: () async {
                                  await _launchURL(
                                      'https://www.instagram.com/joinmun.store/');
                                },
                              ),
                              IconButton(
                                iconSize: 36.0,
                                icon: Icon(FontAwesomeIcons.line),
                                onPressed: () async {
                                  await _launchURL(
                                      'https://line.me/R/ti/p/@dhr6155o');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(12.0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 0.75,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) =>
                                MerchDetail(
                              merch: merch[index],
                            ),
                          ),
                        );
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          color: ConfigBloc().darkModeOn
                              ? Tools.hexToColor("#1f2124")
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
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
                        child: new Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Align(
                              alignment: Alignment.centerRight,
                              child: new Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    merch[index].merchPrice,
                                    style: new TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            new CachedNetworkImage(
                              imageUrl: merch[index].merchImage ?? '',
                              fit: BoxFit.contain,
                              height: 145.0,
                            ),
                            new Text(
                              merch[index].merchName,
                              style: new TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: merch.length,
                ),
              ),
            ),
          ],
        ));
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
