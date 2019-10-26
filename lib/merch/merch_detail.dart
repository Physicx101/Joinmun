import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joinmun_2019/config/index.dart';
import 'package:joinmun_2019/model/merch.dart';
import 'package:joinmun_2019/utils/joinmun.dart';
import 'package:joinmun_2019/utils/tools.dart';
import 'package:photo_view/photo_view.dart';

class MerchDetail extends StatelessWidget {
  static const String routeName = "/merch_detail";
  final Merch merch;

  MerchDetail({Key key, @required this.merch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConfigBloc().darkModeOn
          ? Tools.hexToColor("#1f2124").withOpacity(0.85)
          : Colors.white.withOpacity(0.85),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 300.0,
            child: PhotoView(
              imageProvider: NetworkImage(
                merch.merchImage,
              ),
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered,
              enableRotation: true,
              backgroundDecoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          RawMaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Icon(
              FontAwesomeIcons.times,
              color: Colors.white,
              size: 24.0,
            ),
            shape: new CircleBorder(),
            elevation: 2.0,
            fillColor: Tools.hexToColor(Joinmun.joinmun_color_7),
            padding: const EdgeInsets.all(16.0),
          ),
        ],
      ),
    );
  }
}
