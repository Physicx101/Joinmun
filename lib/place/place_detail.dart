import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:joinmun_2019/model/place.dart';
import 'package:joinmun_2019/universal/joinmun_scaffold.dart';

class PlaceDetail extends StatelessWidget {
  static const String routeName = "/place_detail";
  final Place place;

  PlaceDetail({Key key, @required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return JoinmunScaffold(
      title: place.placeName,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: Hero(
                tag: place.placeImage,
                child: new ConstrainedBox(
                  constraints: new BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.35),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: place.placeImage,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "${place.placeName}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.title.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                place.placeDesc,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption.copyWith(fontSize: 14, height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
