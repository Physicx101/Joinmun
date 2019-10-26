import 'package:flutter/material.dart';
import 'package:joinmun_2019/config/index.dart';
import 'package:joinmun_2019/utils/tools.dart';

class ImageCard extends StatelessWidget {
  final String img;

  const ImageCard({Key key, this.img}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        img,
        fit: BoxFit.scaleDown,
        filterQuality: FilterQuality.high,
      ),
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
    );
  }
}
