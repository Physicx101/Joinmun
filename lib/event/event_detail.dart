import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:joinmun_2019/event/event_floorplan.dart';
import 'package:joinmun_2019/model/event.dart';
import 'package:joinmun_2019/universal/joinmun_scaffold.dart';
import 'package:joinmun_2019/utils/joinmun.dart';
import 'package:joinmun_2019/utils/tools.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetail extends StatelessWidget {
  static const String routeName = "/event_detail";
  final Event event;

  EventDetail({Key key, @required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return JoinmunScaffold(
      title: event.eventTitle,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: Hero(
                tag: event.eventImage,
                child: new ConstrainedBox(
                  constraints: new BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height * 0.35),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: event.eventImage,
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
                event.eventTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.title.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.calendar,
                    size: 12.0,
                    color: Tools.hexToColor(Joinmun.joinmun_color_3),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      event.eventDate ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.mapMarkerAlt,
                    size: 12.0,
                    color: Tools.hexToColor(Joinmun.joinmun_color_7),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      event.eventPlace ?? '',
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
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.tshirt,
                    size: 12.0,
                    color: Tools.hexToColor(Joinmun.joinmun_color_3),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      event.eventDresscode ?? '',
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
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                event.eventDescription,
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(fontSize: 14, height: 1.5),
              ),
            ),
            event.eventTitle == "Opening Ceremony" ||
                    event.eventTitle == "Committee Sessions"
                ? event.eventTitle == "Opening Ceremony"
                    ? Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventFloorPlan(
                                  event: event,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "View Floor Plan",
                            maxLines: 1,
                            style: Theme.of(context).textTheme.caption.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color:
                                    Tools.hexToColor(Joinmun.joinmun_color_7)),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EventFloorPlan(
                                  event: event,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "View Floor Plan",
                            maxLines: 1,
                            style: Theme.of(context).textTheme.caption.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color:
                                    Tools.hexToColor(Joinmun.joinmun_color_7)),
                          ),
                        ),
                      )
                : Container(),
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
