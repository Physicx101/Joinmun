import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:joinmun_2019/config/index.dart';
import 'package:joinmun_2019/model/sponsor.dart';
import 'package:joinmun_2019/utils/tools.dart';

class SponsorList extends StatelessWidget {
  final Sponsor sponsor;

  SponsorList({Key key, @required this.sponsor}) : super(key: key);

  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    if (sponsor.sponsorGrade == "Gold") {
      return InkWell(
        borderRadius: BorderRadius.circular(8),
        child: Ink(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width,
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
            child: CachedNetworkImage(
              imageUrl: sponsor.sponsorImage,
              fit: BoxFit.contain,
            ),
          ),
        ),
      );
    } else if (sponsor.sponsorGrade == "Silver") {
      return InkWell(
        borderRadius: BorderRadius.circular(8),
        child: Ink(
           height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.3,
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
            child: CachedNetworkImage(
              imageUrl: sponsor.sponsorImage,
              fit: BoxFit.contain,
            ),
          ),
        ),
      );
    } else {
      return InkWell(
        borderRadius: BorderRadius.circular(8),
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
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CachedNetworkImage(
              imageUrl: sponsor.sponsorImage,
              fit: BoxFit.contain,
            ),
          ),
        ),
      );
    }
  }
}
