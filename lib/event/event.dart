//import 'package:SquanchyFlutter/utils/button_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joinmun/utils/flexible_app_bar_widget.dart';

class Event {
  final String name;
  final String time;
  final String date;
  final String dressCode;
  final String image;
  final IconData icon;
  final List<Speaker> speakers;
  final String where;
  final String floor;
  final String when;
  final String description;

  const Event({
    this.name,
    this.time,
    this.date,
    this.dressCode,
    this.image,
    this.icon,
    this.speakers,
    this.where,
    this.floor,
    this.when,
    this.description,
  });
}

class Speaker {
  final String fullName;
  final String avatarUrl;

  const Speaker({this.fullName, this.avatarUrl});
}

const List<Event> kEvenLists = const <Event>[
  const Event(
    name: "Opening Ceremony",
    speakers: const <Speaker>[
      const Speaker(
          fullName: "Eugenio Marletti",
          avatarUrl:
              "http://it.droidcon.com/2017/wp-content/uploads/2015/02/3f952ce.jpg"),
      const Speaker(
          fullName: "Sebastiano Poggi",
          avatarUrl:
              "http://it.droidcon.com/2017/wp-content/uploads/2015/02/sebastiano-poggi.jpg"),
    ],
    where: "Keraton Ballroom",
    dressCode: "Business Attire",
    image: "assets/opening-ceremony.jpg",
    icon: Icons.stars,
    floor: "Ground floor",
    date: "Thursday, 25 October",
    time: "16:00 - 18:00",
    when: "Thursday, 25 October at 16:00 - 18:00",
    description: """
Welcoming the delegates with a spectacular opening at the Marriott Ballroom, this event will indulge delegates with a opening dinner. The ceremony will be filled with traditional performances, and 3 amazing speakers all for the talks revolving our grand theme. For beginner MUNers, worry not for we have an MUN 101 for you to learn the procedures of an MUN.
""",
  ),
  const Event(
    name: "Closing Ceremony",
    speakers: const <Speaker>[
      const Speaker(
          fullName: "Eugenio Marletti",
          avatarUrl:
              "http://it.droidcon.com/2017/wp-content/uploads/2015/02/3f952ce.jpg"),
      const Speaker(
          fullName: "Sebastiano Poggi",
          avatarUrl:
              "http://it.droidcon.com/2017/wp-content/uploads/2015/02/sebastiano-poggi.jpg"),
    ],
    where: "Keraton Ballroom",
    dressCode: "Evening dress (F) & Black tie suit (M)",
    image: "assets/closing-ceremony.jpg",
    icon: Icons.stars,
    floor: "Ground floor",
    date: "Saturday, 27 October",
    time: "20:00 - 23:30",
    when: "Saturday, 27 October at 20:00 - 23:30",
    description: """
What better way to close your whole experience in JOINMUN than a wonderful gala dinner? The awarding ceremonies filled with wonders will wrap up a wholesome conference. All the excitement of the committee sessions will lead up to this. Prepare your best gowns and suit and bring along a date for the night!
""",
  ),
  const Event(
    name: "Committee Session",
    speakers: const <Speaker>[
      const Speaker(
          fullName: "Eugenio Marletti",
          avatarUrl:
              "http://it.droidcon.com/2017/wp-content/uploads/2015/02/3f952ce.jpg"),
      const Speaker(
          fullName: "Sebastiano Poggi",
          avatarUrl:
              "http://it.droidcon.com/2017/wp-content/uploads/2015/02/sebastiano-poggi.jpg"),
    ],
    where: "Arjuna Room",
    dressCode: "Evening dress (F) & Black tie suit (M)",
    image: "assets/committee.jpg",
    icon: Icons.stars,
    floor: "Ground floor",
    date: "Saturday, 27 October",
    time: "20:00 - 23:30",
    when: "Saturday, 27 October at 20:00 - 23:30",
    description: """
Committee Session is the main event of JOINMUN 2018. There will be 6 councils (UNGA, UNHRC, UNFCCC, UNSC, G20, PCA) + Press Committee. For 2 days straight (insert date), the delegate's skills in speech, diplomacy, and research will be put to the test by having discussions about their respective councils topic.
""",
  ),
  const Event(
    name: "Social Night",
    speakers: const <Speaker>[
      const Speaker(
          fullName: "Eugenio Marletti",
          avatarUrl:
              "http://it.droidcon.com/2017/wp-content/uploads/2015/02/3f952ce.jpg"),
      const Speaker(
          fullName: "Sebastiano Poggi",
          avatarUrl:
              "http://it.droidcon.com/2017/wp-content/uploads/2015/02/sebastiano-poggi.jpg"),
    ],
    where: "Mezzanine Eatery",
    dressCode: "Neon or white casual tops!",
    image: "assets/social-night.jpg",
    icon: Icons.local_bar,
    floor: "Ground floor",
    date: "Friday, 26 October",
    time: "20:00 - 23:30",
    when: "Friday, 26 October at 20:00 - 23:30",
    description: """
Social Night is one of the most anticipated event in JOINMUN 2018. The event will be held at Mezzanine Greenhouse with a black light theme. The delegates will enjoy engaging with one another by dancing, playing beer pong, body painting, and many more. Dress to impress and wear your glow.
""",
  ),
  const Event(
    name: "Cultural Trip",
    speakers: const <Speaker>[
      const Speaker(
          fullName: "Eugenio Marletti",
          avatarUrl:
              "http://it.droidcon.com/2017/wp-content/uploads/2015/02/3f952ce.jpg"),
      const Speaker(
          fullName: "Sebastiano Poggi",
          avatarUrl:
              "http://it.droidcon.com/2017/wp-content/uploads/2015/02/sebastiano-poggi.jpg"),
    ],
    where: "Tamansari and Kraton Yogyakarta",
    dressCode: "Comfortable, casual clothing",
    image: "assets/cultural-trip.jpg",
    icon: Icons.directions_bus,
    floor: "Ground floor",
    date: "Sunday, 28 October",
    time: "09:00 - 12:00",
    when: "Sunday, 28 October at 09:00 - 12:00",
    description: """
Cultural Trip is one of the trade mark event of JOINMUN. On October 28, we would like take you to experience Jogjakarta in its finest historical places. The delegates will have a chance to emerge themselves in the place where the history were made in Taman Sari and you'll get to watch the infamous Javanese traditional dance performance in the Sultan's Palace of Kraton Ngayogyakarta.

""",
  ),
];

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.teal,
  accentColor: Colors.redAccent,
);

class EventStyle extends TextStyle {
  const EventStyle({
    double fontSize: 12.0,
    FontWeight fontWeight,
    Color color: Colors.black87,
    double letterSpacing,
    double height,
  }) : super(
          inherit: false,
          color: color,
          fontFamily: 'Montserrat',
          fontSize: fontSize,
          fontWeight: fontWeight,
          textBaseline: TextBaseline.alphabetic,
          letterSpacing: letterSpacing,
          height: height,
        );
}

class EventCardWidget extends StatelessWidget {
  EventCardWidget(this.event);

  final Event event;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final TextStyle descriptionStyle = theme.textTheme.subhead;
    final TextStyle titleStyle = const TextStyle(
        fontSize: 24.0, fontWeight: FontWeight.w500, fontFamily: 'LemonMilk');
    final TextStyle dayStyle = const TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.w500, fontFamily: 'Montserrat');
    final TextStyle timeStyle = const TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.w500, fontFamily: 'Montserrat');
    Image image;

    if (event.image != null) {
      image = new Image.asset(
        event.image,
        fit: BoxFit.cover,
      );
    } else {
      image = new Image.asset(
        'assets/nothing_here.png',
        fit: BoxFit.cover,
      );
    }

    final card = new Container(
      child: new Card(
        elevation: 0.0,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Hero(
                tag: event.image,
                child: new ClipRRect(
                  borderRadius: new BorderRadius.circular(8.0),
                  child: new Image.asset(
                    event.image,
                    height: 188.0,
                    fit: BoxFit.cover,
                  ),
                )),
            new Expanded(
              child: new Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                child: new DefaultTextStyle(
                  style: descriptionStyle,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: new Text(
                          event.name,
                          style: titleStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: new Text(
                          event.date,
                          style: timeStyle.copyWith(color: Colors.black54),
                        ),
                      ),
                      new Text(
                        event.time,
                        style: timeStyle.copyWith(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return new GestureDetector(
      onTap: () => showEventPage(context, event),
      child: new Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: card,
      ),
    );
  }

  void showEventPage(BuildContext context, Event event) {
    Navigator.push(
      context,
      new MaterialPageRoute<Null>(
        settings: const RouteSettings(name: 'event'),
        builder: (BuildContext context) {
          return new Theme(
            data: Theme.of(context),
            child: new EventDetail(event),
          );
        },
      ),
    );
  }
}

class EventDetail extends StatelessWidget {
  final Event event;

  EventDetail(this.event);
  @override
  Widget build(BuildContext context) {
    List<Widget> _speakersWidgets(
        TextStyle speakerTextStyle, List<Speaker> speakers) {
      final speakerNames =
          speakers.map((speaker) => speaker.fullName).join(", ");

      final speakerNamesWidget =
          new Text(speakerNames, style: speakerTextStyle);

      return [
        new Row(
            children: speakers
                .map((speaker) => new Padding(
                      padding: new EdgeInsets.only(right: 6.0),
                      child: new CircleAvatar(
                        backgroundImage: new NetworkImage(speaker.avatarUrl),
                        radius: 20.0,
                      ),
                    ))
                .toList()),
        new Padding(
            padding: new EdgeInsets.only(top: 9.0), child: speakerNamesWidget),
      ];
    }

    Widget _rowWithLabelWidget(String label, TextStyle labelTextStyle,
            double labelChildrenInset, Iterable<Widget> children) =>
        new Padding(
          padding: new EdgeInsets.only(bottom: 32.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              new SizedBox(
                width: labelChildrenInset,
                child: new Text(label, style: labelTextStyle),
              ),
            ]..addAll(children),
          ),
        );
    var theme = Theme.of(context);

    final leftPadding = 16.0;
    final keylineAfterLabel = 72.0 - leftPadding;

    final speakerTextStyle = theme.textTheme.title.copyWith(
      color: Colors.white,
      fontSize: 14.0,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w700,
      letterSpacing: -.1,
    );

    final labelsTextStyle = speakerTextStyle.copyWith(
        color: theme.primaryColor, fontFamily: 'Montserrat');

    final floorTextStyle = theme.textTheme.body1.copyWith(
      color: const Color(0x8A6B6B6B),
    );

    final descriptionTextStyle = theme.textTheme.body1
        .copyWith(height: 1.5, fontFamily: 'Montserrat', color: Colors.black54);

    final rowWhen =
        _rowWithLabelWidget("When", labelsTextStyle, keylineAfterLabel, [
      new Text(
        event.when,
        style: descriptionTextStyle,
      ),
    ]);

    final rowWhere =
        _rowWithLabelWidget("Where", labelsTextStyle, keylineAfterLabel, [
      new Text(event.where, style: descriptionTextStyle),
    ]);

    final rowDressCode = _rowWithLabelWidget(
        "DC",
        labelsTextStyle,
        keylineAfterLabel,
        [new Text(event.dressCode, style: descriptionTextStyle)]);

    final rowAbout = new Padding(
      padding: new EdgeInsets.only(bottom: 16.0),
      child: new Text("About", style: labelsTextStyle),
    );

    final rowDescription = new Text(
      event.description,
      style: descriptionTextStyle,
    );

    final TextStyle titleStyle = const TextStyle(
        fontSize: 24.0, fontWeight: FontWeight.w500, fontFamily: 'LemonMilk');
    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: 250.0,
            backgroundColor: Colors.transparent,
            flexibleSpace: new FlexibleSpaceBar(
              //TODO: Fix hero animation
              background: new Hero(
                tag: event.image,
                child: new Image.asset(
                  event.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          new SliverToBoxAdapter(
            child: new Padding(
              padding: new EdgeInsets.all(16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    event.name,
                    style: titleStyle,
                  ),
                  new SizedBox(
                    height: 8.0,
                  ),
                  rowWhen,
                  rowWhere,
                  rowDressCode,
                  rowAbout,
                  rowDescription,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EventView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const EventGridPage(events: kEvenLists);
  }
}

class EventGridPage extends StatefulWidget {
  const EventGridPage({Key key, this.events}) : super(key: key);

  final List<Event> events;

  @override
  _EventGridPageState createState() => new _EventGridPageState();
}

class _EventGridPageState extends State<EventGridPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return new Theme(
      data: _kTheme.copyWith(platform: Theme.of(context).platform),
      child: new Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldKey,
        body: new CustomScrollView(
          slivers: <Widget>[
            _buildBody(context, statusBarHeight),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, double statusBarHeight) {
    final EdgeInsets mediaPadding = MediaQuery.of(context).padding;
    final EdgeInsets padding = new EdgeInsets.only(
        top: 0.0,
        left: 8.0 + mediaPadding.left,
        right: 8.0 + mediaPadding.right,
        bottom: 0.0);
    return new SliverPadding(
      padding: padding,
      sliver: new SliverFixedExtentList(
        itemExtent: 320.0,
        delegate: new SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final Event event = widget.events[index];
            return new EventCardWidget(
              event,
            );
          },
          childCount: widget.events.length,
        ),
      ),
    );
  }
}
