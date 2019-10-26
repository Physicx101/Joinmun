import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:joinmun_2019/chair/chair_detail.dart';
import 'package:joinmun_2019/model/chair.dart';
import 'package:joinmun_2019/utils/tools.dart';

class ChairList extends StatelessWidget {
  final Chair chair;

  const ChairList({Key key, @required this.chair}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChairDetail(
                chair: chair,
              ),
            ),
          );
        },
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ConstrainedBox(
                  constraints: BoxConstraints.expand(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                  child: Hero(
                    tag: chair.chairName,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: chair.chairImage,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            chair.chairName,
                            style: Theme.of(context).textTheme.title,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: 5,
                            color: Tools.multiColors[Random().nextInt(4)],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        chair.chairGroup,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        chair.chairInstitute,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
