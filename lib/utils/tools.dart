import 'package:flutter/material.dart';
import 'package:joinmun_2019/utils/joinmun.dart';

class Tools {
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static List<Color> multiColors = [
    hexToColor(Joinmun.joinmun_color_3),
    hexToColor(Joinmun.joinmun_color_4),
    hexToColor(Joinmun.joinmun_color_6),
    hexToColor(Joinmun.joinmun_color_7),
  ];
}
