//import 'package:SquanchyFlutter/utils/button_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joinmun/utils/flexible_app_bar_widget.dart';


class Event {
  final String name;
  final String time;
  final String dressCode;
  final String image;
  final String imagePath;
  final IconData icon;
  final List<Speaker> speakers;
  final String where;
  final String floor;
  final String when;
  final String description;
  final List<RecipeIngredient> ingredients;
  final List<RecipeStep> steps;

  const Event(
      {this.name,
        this.time,
      this.dressCode,
      this.image,
      this.imagePath,
      this.icon,
      this.speakers,
      this.where,
      this.floor,
      this.when,
      this.description,
      this.ingredients,
      this.steps});
}

class RecipeIngredient {
  const RecipeIngredient({this.amount, this.description});

  final String amount;
  final String description;
}

class RecipeStep {
  const RecipeStep({this.duration, this.description});

  final String duration;
  final String description;
}

class Speaker {
  final String fullName;
  final String avatarUrl;

  const Speaker({this.fullName, this.avatarUrl});
}

const List<Event> kEvenLists = const <Event>[
  const Event(
    name: "Opening Ceremony",
    ingredients: const <RecipeIngredient>[
      const RecipeIngredient(
          amount: '6 pieces', description: 'Mozzarella cheese'),
      const RecipeIngredient(amount: '6 pieces', description: 'Toasts'),
      const RecipeIngredient(amount: '⅔ cup', description: 'Homemade pesto'),
      const RecipeIngredient(
          amount: '1tbsp', description: 'Freshly ground pepper'),
      const RecipeIngredient(amount: '1 tsp', description: 'Salt'),
    ],
    steps: const <RecipeStep>[
      const RecipeStep(description: 'Put in oven'),
      const RecipeStep(duration: '45 min', description: 'Cook'),
    ],
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
    dressCode: "Casual",
    image: "assets/pesto/image11.jpg",
    imagePath: "assets/pesto/",
    icon: Icons.stars,
    floor: "Ground floor",
    when: "Thursday, 25 October at 16:00 - 18:00",
    description: """
In this day and age, the Android UI is getting more and more features. Which is amazing. But they get layered on top of years of TODOs, less-than-clean code, and quick patches. This means the APIs are not as terse as us devs would like, and there’s plenty of unwritten knowledge to have to make things work. What if there was something that took the best bits of the Android UI model and wrapped that in a modern, sensible codebase?
""",
  ),
  const Event(
    name: "Closing Ceremony",
    ingredients: const <RecipeIngredient>[
      const RecipeIngredient(
          amount: '6 pieces', description: 'Mozzarella cheese'),
      const RecipeIngredient(amount: '6 pieces', description: 'Toasts'),
      const RecipeIngredient(amount: '⅔ cup', description: 'Homemade pesto'),
      const RecipeIngredient(
          amount: '1tbsp', description: 'Freshly ground pepper'),
      const RecipeIngredient(amount: '1 tsp', description: 'Salt'),
    ],
    steps: const <RecipeStep>[
      const RecipeStep(description: 'Put in oven'),
      const RecipeStep(duration: '45 min', description: 'Cook'),
    ],
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
    dressCode: "Casual",
    image: "assets/pesto/image9.jpg",
    imagePath: "assets/pesto/",
    icon: Icons.stars,
    floor: "Ground floor",
    when: "Thursday, 25 October at 16:00 - 18:00",
    description: """
In this day and age, the Android UI is getting more and more features. Which is amazing. But they get layered on top of years of TODOs, less-than-clean code, and quick patches. This means the APIs are not as terse as us devs would like, and there’s plenty of unwritten knowledge to have to make things work. What if there was something that took the best bits of the Android UI model and wrapped that in a modern, sensible codebase?
""",
  ),
  const Event(
    name: "Social Night",
    ingredients: const <RecipeIngredient>[
      const RecipeIngredient(
          amount: '6 pieces', description: 'Mozzarella cheese'),
      const RecipeIngredient(amount: '6 pieces', description: 'Toasts'),
      const RecipeIngredient(amount: '⅔ cup', description: 'Homemade pesto'),
      const RecipeIngredient(
          amount: '1tbsp', description: 'Freshly ground pepper'),
      const RecipeIngredient(amount: '1 tsp', description: 'Salt'),
    ],
    steps: const <RecipeStep>[
      const RecipeStep(description: 'Put in oven'),
      const RecipeStep(duration: '45 min', description: 'Cook'),
    ],
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
    dressCode: "Casual",
    image: "assets/pesto/image8.jpg",
    imagePath: "assets/pesto/",
    icon: Icons.local_bar,
    floor: "Ground floor",
    when: "Thursday, 25 October at 16:00 - 18:00",
    description: """
In this day and age, the Android UI is getting more and more features. Which is amazing. But they get layered on top of years of TODOs, less-than-clean code, and quick patches. This means the APIs are not as terse as us devs would like, and there’s plenty of unwritten knowledge to have to make things work. What if there was something that took the best bits of the Android UI model and wrapped that in a modern, sensible codebase?
""",
  ),
  const Event(
    name: "Cultural Trip",
    ingredients: const <RecipeIngredient>[
      const RecipeIngredient(
          amount: '6 pieces', description: 'Mozzarella cheese'),
      const RecipeIngredient(amount: '6 pieces', description: 'Toasts'),
      const RecipeIngredient(amount: '⅔ cup', description: 'Homemade pesto'),
      const RecipeIngredient(
          amount: '1tbsp', description: 'Freshly ground pepper'),
      const RecipeIngredient(amount: '1 tsp', description: 'Salt'),
    ],
    steps: const <RecipeStep>[
      const RecipeStep(description: 'Put in oven'),
      const RecipeStep(duration: '45 min', description: 'Cook'),
    ],
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
    dressCode: "Casual",
    image: "assets/pesto/image7.jpg",
    imagePath: "assets/pesto/",
    icon: Icons.directions_bus,
    floor: "Ground floor",
    when: "Thursday, 25 October at 16:00 - 18:00",
    description: """
In this day and age, the Android UI is getting more and more features. Which is amazing. But they get layered on top of years of TODOs, less-than-clean code, and quick patches. This means the APIs are not as terse as us devs would like, and there’s plenty of unwritten knowledge to have to make things work. What if there was something that took the best bits of the Android UI model and wrapped that in a modern, sensible codebase?
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
          fontFamily: 'GoogleSans',
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
        fontSize: 18.0, fontWeight: FontWeight.w500, fontFamily: 'CenturyGothic');
    final TextStyle timeStyle = const TextStyle(
    fontSize: 20.0, fontWeight: FontWeight.w500, fontFamily: 'CenturyGothic');
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

    final SafeArea card = new SafeArea(
      top: false,
      bottom: false,
      child: new Container(
        child: new Card(
          elevation: 0.0,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // photo and title
              new SizedBox(
                height: 184.0,
                child: new Stack(
                  children: <Widget>[//TODO: fix hero animation
                    new Positioned.fill(
                        child: new ClipRRect(
                          borderRadius: new BorderRadius.circular(8.0),
                          child: new Image.asset(event.image,
                            fit: BoxFit.cover,),
                        )
                    ),
                  ],
                ),
              ),
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: new DefaultTextStyle(
                    style: descriptionStyle,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    child: new Column(
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
                          child: new Text("Rabu, 17 Agustus 1945",  style: timeStyle.copyWith(color: Colors.black54),),
                        ),
                        new Text("16:00  - 18:00",  style: timeStyle.copyWith(color: Colors.black54),),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
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
        settings: const RouteSettings(name:'event'),
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

    List<Widget> _speakersWidgets
        (TextStyle speakerTextStyle, List<Speaker> speakers) {
      final speakerNames = speakers.map((speaker) => speaker.fullName).join(", ");

      final speakerNamesWidget = new Text(speakerNames, style: speakerTextStyle);

      return [
        new Row(
            children: speakers
                .map((speaker) =>
            new Padding(
              padding: new EdgeInsets.only(right: 6.0),
              child: new CircleAvatar(
                backgroundImage: new NetworkImage(speaker.avatarUrl),
                radius: 20.0,
              ),
            )
            )
                .toList()),
        new Padding(
            padding: new EdgeInsets.only(top: 9.0), child: speakerNamesWidget),
      ];
    }

    Widget _rowWithLabelWidget(String label,
        TextStyle labelTextStyle,
        double labelChildrenInset,
        Iterable<Widget> children) =>
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
            ]
              ..addAll(children),
          ),
        );
    var theme = Theme.of(context);

    final leftPadding = 16.0;
    final keylineAfterLabel = 72.0 - leftPadding;

    final titleTextStyle = theme.textTheme.display1.copyWith(
      color: Colors.white,
      fontSize: 24.0,
      fontFamily: "League Spartan",
      fontWeight: FontWeight.w700,
    );

    final speakerTextStyle = theme.textTheme.title.copyWith(
      color: Colors.white,
      fontSize: 14.0,
      height: 1.714285714,
      fontFamily: "GoogleSans",
      fontWeight: FontWeight.w700,
      letterSpacing: -.1,
    );

    final labelsTextStyle = speakerTextStyle.copyWith(
      color: theme.primaryColor,
    );

    final floorTextStyle = theme.textTheme.body1.copyWith(
      color: const Color(0x8A6B6B6B),
    );

    final descriptionTextStyle = theme.textTheme.body1.copyWith(
      height: 1.95,
    );



    final rowWhen = _rowWithLabelWidget(
        "When",
        labelsTextStyle,
        keylineAfterLabel,
        [
          new Text(event.when),
        ]
    );

    final rowWhere = _rowWithLabelWidget(
        "Where",
        labelsTextStyle,
        keylineAfterLabel,
        [
          new Text(event.where),
        ]
    );

    final rowDressCode = _rowWithLabelWidget(
        "DC",
        labelsTextStyle,
        keylineAfterLabel,
        [
          new Text(event.dressCode),
        ]
    );

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
                tag: event.name,
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
      sliver: new SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500.0,
          crossAxisSpacing: 8.0,
        ),
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
