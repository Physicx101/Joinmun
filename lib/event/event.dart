//import 'package:SquanchyFlutter/utils/button_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Event {
  final String name;
  final String dressCode;
  final String image;
  final IconData icon;
  final List<Speaker> speakers;
  final String where;
  final String floor;
  final String when;
  final String description;
   final List<RecipeIngredient> ingredients;
  final List<RecipeStep> steps;

  const Event({
  this.name,
  this.dressCode,
  this.image,
  this.icon,
  this.speakers,
  this.where,
  this.floor,
  this.when,
  this.description,
  this.ingredients,
  this.steps
  });
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
     ingredients: const<RecipeIngredient>[
      const RecipeIngredient(amount: '6 pieces', description: 'Mozzarella cheese'),
      const RecipeIngredient(amount: '6 pieces', description: 'Toasts'),
      const RecipeIngredient(amount: '⅔ cup', description: 'Homemade pesto'),
      const RecipeIngredient(amount: '1tbsp', description: 'Freshly ground pepper'),
      const RecipeIngredient(amount: '1 tsp', description: 'Salt'),
    ],
    steps: const<RecipeStep>[
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
    image: "assets/pesto/image10.jpg",
    icon : Icons.stars,
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
    ingredients: const<RecipeIngredient>[
      const RecipeIngredient(amount: '6 pieces', description: 'Mozzarella cheese'),
      const RecipeIngredient(amount: '6 pieces', description: 'Toasts'),
      const RecipeIngredient(amount: '⅔ cup', description: 'Homemade pesto'),
      const RecipeIngredient(amount: '1tbsp', description: 'Freshly ground pepper'),
      const RecipeIngredient(amount: '1 tsp', description: 'Salt'),
    ],
    steps: const<RecipeStep>[
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
    icon : Icons.stars,
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
     ingredients: const<RecipeIngredient>[
      const RecipeIngredient(amount: '6 pieces', description: 'Mozzarella cheese'),
      const RecipeIngredient(amount: '6 pieces', description: 'Toasts'),
      const RecipeIngredient(amount: '⅔ cup', description: 'Homemade pesto'),
      const RecipeIngredient(amount: '1tbsp', description: 'Freshly ground pepper'),
      const RecipeIngredient(amount: '1 tsp', description: 'Salt'),
    ],
    steps: const<RecipeStep>[
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
    icon : Icons.local_bar,
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
     ingredients: const<RecipeIngredient>[
      const RecipeIngredient(amount: '6 pieces', description: 'Mozzarella cheese'),
      const RecipeIngredient(amount: '6 pieces', description: 'Toasts'),
      const RecipeIngredient(amount: '⅔ cup', description: 'Homemade pesto'),
      const RecipeIngredient(amount: '1tbsp', description: 'Freshly ground pepper'),
      const RecipeIngredient(amount: '1 tsp', description: 'Salt'),
    ],
    steps: const<RecipeStep>[
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
    icon : Icons.directions_bus,
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



class EventCard extends StatelessWidget {
  

  const EventCard({ Key key, this.event, this.onTap }) : super(key: key);

  final Event event;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return new GestureDetector(
      onTap: onTap,
      child: new Card(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Hero(
              tag: 'assets/${event.image}',
              child: new Image.asset(
                event.image,
                fit: BoxFit.contain,
              ),
            ),
            new Expanded(
              child: new Row(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: new Icon(
                      event.icon,
                      color: theme.accentColor,
                      size: 40.0,
                    ),
                  ),
                  new Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(event.name, style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 24.0, fontFamily: 'LemonMilk'), softWrap: false, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventDetails extends StatelessWidget {
  final TextStyle titleStyle = const EventStyle(fontSize: 34.0);
  final TextStyle descriptionStyle = const EventStyle(fontSize: 15.0, color: Colors.black54, height: 24.0/15.0);
  final TextStyle itemStyle = const EventStyle(fontSize: 15.0, height: 24.0/15.0);
  final TextStyle itemAmountStyle = new EventStyle(fontSize: 15.0, color: _kTheme.primaryColor, height: 24.0/15.0);
  final TextStyle headingStyle = const EventStyle(fontSize: 16.0, fontWeight: FontWeight.bold, height: 24.0/15.0);

  EventDetails({ Key key, this.event }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new SafeArea(
        top: false,
        bottom: false,
        child: new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
          child: new Table(
            columnWidths: const <int, TableColumnWidth>{
              0: const FixedColumnWidth(64.0)
            },
            children: <TableRow>[
              new TableRow(
                children: <Widget>[
                  new TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: new Icon(
                      event.icon,
                      size: 32.0,
                    )
                  ),
                  new TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: new Text(event.name, style: titleStyle)
                  ),
                ]
              ),
              new TableRow(
                children: <Widget>[
                  const SizedBox(),
                  new Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 4.0),
                    child: new Text('Ingredients', style: headingStyle)
                  ),
                ]
              ),
            ]..addAll(event.ingredients.map(
              (RecipeIngredient ingredient) {
                return _buildItemRow(ingredient.amount, ingredient.description);
              }
            ))..add(
              new TableRow(
                children: <Widget>[
                  const SizedBox(),
                  new Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 4.0),
                    child: new Text('Steps', style: headingStyle)
                  ),
                ]
              )
            )..addAll(event.steps.map(
              (RecipeStep step) {
                return _buildItemRow(step.duration ?? '', step.description);
              }
            )),
          ),
        ),
      ),
    );
  }
   TableRow _buildItemRow(String left, String right) {
    return new TableRow(
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: new Text(left, style: itemAmountStyle),
        ),
        new Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: new Text(right, style: itemStyle),
        ),
      ],
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
  const EventGridPage({ Key key, this.events}) : super(key: key);

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
      bottom: 8.0
    );
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
            return new EventCard(
              event: event,
              onTap: () { showDetailPage(context, event); },
            );
          },
          childCount: widget.events.length,
        ),
      ),
    );
  }

  

  void showDetailPage(BuildContext context, Event event) {
    Navigator.push(context, new MaterialPageRoute<void>(
      settings: const RouteSettings(name: '/pesto/event'),
      builder: (BuildContext context) {
        return new Theme(
          data: _kTheme.copyWith(platform: Theme.of(context).platform),
          child: new EventPage(event: event),
        );
      },
    ));
  }

  
  
}

class EventPage extends StatefulWidget {
  const EventPage({ Key key, this.event }) : super(key: key);

  final Event event;

  @override
  _EventPageState createState() => new _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextStyle menuItemStyle = const EventStyle(fontSize: 15.0, color: Colors.black54, height: 24.0/15.0);

  double _getAppBarHeight(BuildContext context) => MediaQuery.of(context).size.height * 0.3;

  @override
  Widget build(BuildContext context) {
    // The full page content with the recipe's image behind it. This
    // adjusts based on the size of the screen. If the recipe sheet touches
    // the edge of the screen, use a slightly different layout.
    final double appBarHeight = _getAppBarHeight(context);
    final Size screenSize = MediaQuery.of(context).size;
    final bool fullWidth = screenSize.width < 500.0;
    
    return new Scaffold(
      key: _scaffoldKey,
      body: new Stack(
        children: <Widget>[
          new Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            height: appBarHeight + 28.0,
            child: new Hero(
              tag: 'assets/${widget.event.image}',
              child: new Image.asset(
                widget.event.image,
                fit: fullWidth ? BoxFit.fitWidth : BoxFit.cover,
              ),
            ),
          ),
          new CustomScrollView(
            slivers: <Widget>[
              new SliverAppBar(
                expandedHeight: appBarHeight - 28.0,
                backgroundColor: Colors.transparent,
                flexibleSpace: const FlexibleSpaceBar(
                  background: const DecoratedBox(
                    decoration: const BoxDecoration(
                      gradient: const LinearGradient(
                        begin: const Alignment(0.0, -1.0),
                        end: const Alignment(0.0, -0.2),
                        colors: const<Color>[const Color(0x60000000), const Color(0x00000000)],
                      ),
                    ),
                  ),
                ),
              ),
              new SliverToBoxAdapter(
                child: new Stack(
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.only(top: 28.0),
                      width: fullWidth ? null : 500.0,
                      child: new EventDetails(event: widget.event),
                    ),
                  ],
                )
              ),
            ],
          ),
        ],
      ),
    );
  }

}



