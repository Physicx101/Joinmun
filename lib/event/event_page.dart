import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joinmun_2019/event/event_detail.dart';
import 'package:joinmun_2019/home/home_bloc.dart';
import 'package:joinmun_2019/home/index.dart';
import 'package:joinmun_2019/model/event.dart';
import 'package:joinmun_2019/universal/joinmun_scaffold.dart';
import 'package:joinmun_2019/utils/joinmun.dart';
import 'package:joinmun_2019/utils/tools.dart';

class EventPage extends StatelessWidget {
  static const String routeName = "/events";
  List<Event> events;

  @override
  Widget build(BuildContext context) {
    var _homeBloc = HomeBloc();
    var state = _homeBloc.currentState as InHomeState;
    var eventStream = state.events;
    return JoinmunScaffold(
      title: "Events",
      body: StreamBuilder(
          stream: eventStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              events = snapshot.data.documents
                  .map<Event>((doc) => Event.fromMap(doc.data))
                  .toList();
              return ListView.builder(
                itemCount: events.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EventDetail(
                              event: events[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            new Hero(
                              tag: events[index].eventImage,
                              child: new ClipRRect(
                                borderRadius: new BorderRadius.circular(8),
                                child: new ConstrainedBox(
                                  constraints:
                                      new BoxConstraints(maxHeight: 200.0),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: events[index].eventImage,
                                    placeholder: (context, url) => Container(),
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
                                    events[index].eventTitle ?? '',
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .title
                                        .copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const Padding(
                                      padding: const EdgeInsets.only(top: 8)),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        FontAwesomeIcons.calendar,
                                        size: 12.0,
                                        color: Tools.hexToColor(
                                            Joinmun.joinmun_color_3),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          events[index].eventDate ?? '',
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption
                                              .copyWith(fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        FontAwesomeIcons.mapMarkerAlt,
                                        size: 12.0,
                                        color: Tools.hexToColor(
                                            Joinmun.joinmun_color_7),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          events[index].eventPlace ?? '',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption
                                              .copyWith(fontSize: 14),
                                        ),
                                      ),
                                    ],
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
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
