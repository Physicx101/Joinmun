import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joinmun_2019/config/index.dart';
import 'package:joinmun_2019/home/home_bloc.dart';
import 'package:joinmun_2019/home/index.dart';
import 'package:joinmun_2019/model/speaker.dart';
import 'package:joinmun_2019/speaker/speaker_detail.dart';
import 'package:joinmun_2019/universal/joinmun_scaffold.dart';
import 'package:joinmun_2019/utils/tools.dart';

class SpeakerPage extends StatelessWidget {
  static const String routeName = "/speakers";
  List<Speaker> speakers;

  @override
  Widget build(BuildContext context) {
    var _homeBloc = HomeBloc();
    var state = _homeBloc.currentState as InHomeState;
    var speakerStream = state.speakers;
    return JoinmunScaffold(
      title: "Speakers",
      body: StreamBuilder(
          stream: speakerStream,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              speakers = snapshot.data.documents
                  .map<Speaker>((doc) => Speaker.fromMap(doc.data))
                  .toList();
              speakers.sort((a, b) => a.speakerName.compareTo(b.speakerName));
              return ListView.builder(
                itemCount: speakers.length,
                shrinkWrap: true,
                itemBuilder: (c, i) {
                  return Card(
                    elevation: 0.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SpeakerDetail(
                              speaker: speakers[i],
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                ),
                                child: Hero(
                                  tag: speakers[i].speakerImage,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: speakers[i].speakerImage,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          speakers[i].speakerName,
                                          style:
                                              Theme.of(context).textTheme.title,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        AnimatedContainer(
                                          duration: Duration(seconds: 1),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          height: 5,
                                          color: Tools
                                              .multiColors[Random().nextInt(4)],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      speakers[i].speakerTitle,
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .copyWith(fontSize: 14.0),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
