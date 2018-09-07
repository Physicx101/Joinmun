//import 'package:SquanchyFlutter/utils/button_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joinmun/utils/flexible_app_bar_widget.dart';


class Event {
  final String name;
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
    when: "Thursday, 6 April at 16:00",
    description: """
In this day and age, the Android UI is getting more and more features. Which is amazing. But they get layered on top of years of TODOs, less-than-clean code, and quick patches. This means the APIs are not as terse as us devs would like, and there’s plenty of unwritten knowledge to have to make things work. What if there was something that took the best bits of the Android UI model and wrapped that in a modern, sensible codebase?

Turns out, there is. It’s part of a “native cross-platform” framework, Flutter, that is being developed in Google and used in some of their products. While still a long way from stable and feature-complete, Flutter has an interesting approach of including a full framework based off of Dart. It’s modeled on the good bits of the Android UI framework and will allow your code to run consistently across devices, without the weird BSP- or vendor-specific issues we unfortunately got used to.

This talk is going to give you an overview of that framework, highlight where it differs from the Android one, and give you an idea of where things are at this stage of the Flutter development. Let’s try to understand if Flutter is something to look forward to
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
    when: "Thursday, 6 April at 16:00",
    description: """
In this day and age, the Android UI is getting more and more features. Which is amazing. But they get layered on top of years of TODOs, less-than-clean code, and quick patches. This means the APIs are not as terse as us devs would like, and there’s plenty of unwritten knowledge to have to make things work. What if there was something that took the best bits of the Android UI model and wrapped that in a modern, sensible codebase?

Turns out, there is. It’s part of a “native cross-platform” framework, Flutter, that is being developed in Google and used in some of their products. While still a long way from stable and feature-complete, Flutter has an interesting approach of including a full framework based off of Dart. It’s modeled on the good bits of the Android UI framework and will allow your code to run consistently across devices, without the weird BSP- or vendor-specific issues we unfortunately got used to.

This talk is going to give you an overview of that framework, highlight where it differs from the Android one, and give you an idea of where things are at this stage of the Flutter development. Let’s try to understand if Flutter is something to look forward to
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
    when: "Thursday, 6 April at 16:00",
    description: """
In this day and age, the Android UI is getting more and more features. Which is amazing. But they get layered on top of years of TODOs, less-than-clean code, and quick patches. This means the APIs are not as terse as us devs would like, and there’s plenty of unwritten knowledge to have to make things work. What if there was something that took the best bits of the Android UI model and wrapped that in a modern, sensible codebase?

Turns out, there is. It’s part of a “native cross-platform” framework, Flutter, that is being developed in Google and used in some of their products. While still a long way from stable and feature-complete, Flutter has an interesting approach of including a full framework based off of Dart. It’s modeled on the good bits of the Android UI framework and will allow your code to run consistently across devices, without the weird BSP- or vendor-specific issues we unfortunately got used to.

This talk is going to give you an overview of that framework, highlight where it differs from the Android one, and give you an idea of where things are at this stage of the Flutter development. Let’s try to understand if Flutter is something to look forward to
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
    when: "Thursday, 6 April at 16:00",
    description: """
In this day and age, the Android UI is getting more and more features. Which is amazing. But they get layered on top of years of TODOs, less-than-clean code, and quick patches. This means the APIs are not as terse as us devs would like, and there’s plenty of unwritten knowledge to have to make things work. What if there was something that took the best bits of the Android UI model and wrapped that in a modern, sensible codebase?

Turns out, there is. It’s part of a “native cross-platform” framework, Flutter, that is being developed in Google and used in some of their products. While still a long way from stable and feature-complete, Flutter has an interesting approach of including a full framework based off of Dart. It’s modeled on the good bits of the Android UI framework and will allow your code to run consistently across devices, without the weird BSP- or vendor-specific issues we unfortunately got used to.

This talk is going to give you an overview of that framework, highlight where it differs from the Android one, and give you an idea of where things are at this stage of the Flutter development. Let’s try to understand if Flutter is something to look forward to
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

  static final double height = 322.0;

  final Event event;

  @override
  Widget build(BuildContext context) {
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

    final Card card = new Card(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Text(
                  event.name ?? '',
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
                const Padding(padding: const EdgeInsets.only(top: 8.0)),
                new Text(
                  event.description ?? '',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
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
        settings: const RouteSettings(name: '/sessions/session'),
        builder: (BuildContext context) {
          return new Theme(
            data: Theme.of(context),
            child: new EventPage(event),
          );
        },
      ),
    );
  }
}

class EventPage extends StatelessWidget {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final Event event;


  EventPage(this.event);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
      fontFamily: "League Spartan",
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

    final titleWidget = new Padding(
        padding: new EdgeInsets.only(top: 12.0, bottom: 8.0),
        child: new Text(event.name, style: titleTextStyle));

    final appBarBottom = new Padding(
      padding: new EdgeInsets.only(left: 72.0, right: 8.0, bottom: 8.0),
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: _speakersWidgets(speakerTextStyle, event.speakers)
          ..add(titleWidget),
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    )
    ;

    final appBar = new AppBar(
      leading: new BackButton(),
      bottom: new FlexibleAppBarBottomWidget
          .fromContext(context, appBarBottom),
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
          new Text("   "),
          new Text(event.floor, style: floorTextStyle),
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

    final body = new ListView(
      padding: new EdgeInsets.fromLTRB(leftPadding, 18.0, 24.0, 18.0),
      children: [
        rowWhen,
        rowWhere,
        rowDressCode,
        rowAbout,
        rowDescription,
      ],
    );


    return new Scaffold(
      key: scaffoldKey,
      appBar: appBar,
      body: body,
      backgroundColor: const Color(0xFFF1F1F1),
    );
  }

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
        top: 8.0,
        left: 8.0 + mediaPadding.left,
        right: 8.0 + mediaPadding.right,
        bottom: 8.0);
    return new SliverPadding(
      padding: padding,
      sliver: new SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500.0,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
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
