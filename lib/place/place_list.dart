import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:joinmun_2019/model/place.dart';
import 'package:joinmun_2019/place/place_detail.dart';
import 'package:joinmun_2019/utils/tools.dart';

class PlaceList extends StatelessWidget {
  final List<Place> allPlaces;

  const PlaceList({Key key, @required this.allPlaces}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: allPlaces.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlaceDetail(
                  place: allPlaces[index],
                ),
              ),
            );
          },
          child: Container(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Hero(
                  tag: allPlaces[index].placeImage,
                  child: new ClipRRect(
                    borderRadius: new BorderRadius.circular(8),
                    child: new ConstrainedBox(
                      constraints: new BoxConstraints(maxHeight: 200.0),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: allPlaces[index].placeImage,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                new Padding(
                  padding: const EdgeInsets.all(8),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new Text(
                        allPlaces[index].placeName ?? '',
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.title.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Padding(padding: const EdgeInsets.only(top: 8)),
                      new Text(
                        allPlaces[index].placeDesc ?? '',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(fontSize: 12),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
