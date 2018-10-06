import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:joinmun/schedule/schedule.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => new _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  List<Place> allPlaces;
  StreamSubscription<QuerySnapshot> sub;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 4);
    super.initState();

    final CollectionReference collection =
        Firestore.instance.collection('place');
    sub = collection.snapshots().listen((QuerySnapshot snapshot) {
      setState(() {
        allPlaces = snapshot.documents.map(_toPlaces).toList();
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
    sub?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    if (allPlaces == null) {
      return new Scaffold(
        appBar: new PreferredSize(
          preferredSize: new Size.fromHeight(kTextTabBarHeight),
          child: new Material(
            color: theme.primaryColor,
            elevation: 4.0,
            child: new TabBar(
              labelColor: theme.accentColor,
              unselectedLabelColor: Colors.grey,
              controller: controller,
              tabs: <Widget>[
                new Tab(text: "Art Museum"),
                new Tab(text: "Landmarks"),
                new Tab(text: "Nature"),
                new Tab(text: "Culinary"),
              ],
            ),
          ),
        ),
        body: new Center(
            child: new CircularProgressIndicator(),
          ),
      );
    }
    return new Scaffold(
      appBar: new PreferredSize(
        preferredSize: new Size.fromHeight(kTextTabBarHeight),
        child: new Material(
          color: theme.primaryColor,
          elevation: 4.0,
          child: new TabBar(
            isScrollable: true,
            labelColor: theme.accentColor,
            unselectedLabelColor: Colors.grey,
            controller: controller,
            tabs: <Widget>[
              new Tab(text: "Art & Museum"),
              new Tab(text: "Landmarks"),
              new Tab(text: "Nature"),
              new Tab(text: "Culinary"),
            ],
          ),
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          buildListForPlaces(
            context,
            allPlaces.where((Place place) => place.type == 'art').toList()
              ..sort(),
          ),
          buildListForPlaces(
            context,
            allPlaces.where((Place place) => place.type == 'landmark').toList()
              ..sort(),
          ),
          buildListForPlaces(
            context,
            allPlaces.where((Place place) => place.type == 'nature').toList()
              ..sort(),
          ),
          buildListForPlaces(
            context,
            allPlaces.where((Place place) => place.type == 'culinary').toList()
              ..sort(),
          ),
        ],
      ),
    );
  }

  Widget buildListForPlaces(BuildContext context, Iterable<Place> places) {
    final List<Place> listPlaces = places.toList();

    return new ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      itemCount: listPlaces.length,
      itemBuilder: (BuildContext context, int index) {
        Place place = listPlaces[index];

        return new PlaceCard(place);
      },
    );
  }

  static Place _toPlaces(DocumentSnapshot snapshot) {
    return new Place(
      name: snapshot['name'],
      desc: snapshot['desc'],
      type: snapshot['type'],
      image: snapshot['image'],
    );
  }
}

class PlaceCard extends StatelessWidget {
  PlaceCard(this.place);

  static final double height = 322.0;

  final Place place;

  @override
  Widget build(BuildContext context) {
    Image image;

    if (place.image != null) {
      image = new Image.network(
        place.image,
        fit: BoxFit.cover,
      );
    } else {
      image = new Image.asset(
        'assets/fakhri.png',
        fit: BoxFit.cover,
      );
    }

    final Card card = new Card(
      elevation: 0.0,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Hero(
            tag: place.name,
            child: new ClipRRect(
              borderRadius: new BorderRadius.circular(8.0),
              child: new ConstrainedBox(
                constraints: new BoxConstraints(maxHeight: 200.0),
                child: image,
              ),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Text(
                  place.name ?? '',
                  style: titleStyle,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
                const Padding(padding: const EdgeInsets.only(top: 8.0)),
                new Text(
                  place.desc ?? '',
                  style: descStyle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ],
      ),
    );

    return new GestureDetector(
      onTap: () => showPlacePage(context, place),
      child: new Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: card,
      ),
    );
  }

  void showPlacePage(BuildContext context, Place place) {
    Navigator.push(
      context,
      new MaterialPageRoute<Null>(
        settings: const RouteSettings(name: '/places/place'),
        builder: (BuildContext context) {
          return new Theme(
            data: Theme.of(context),
            child: new PlacePage(place),
          );
        },
      ),
    );
  }
}

class PlacePage extends StatelessWidget {
  

  final Place place;

  PlacePage(this.place);

  @override
  Widget build(BuildContext context) {
    Image image;

    if (place.image != null) {
      image = new Image.network(
        place.image,
        fit: BoxFit.cover,
      );
    } else {
      image = new Image.asset(
        'assets/fakrhi.png',
        fit: BoxFit.cover,
      );
    }

    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: 250.0,
            backgroundColor: Colors.transparent,
            flexibleSpace: new FlexibleSpaceBar(
              //title: const Text('Demo'),
              background: new Hero(
               tag: place.name,
                child: image,
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
                    place.name,
                    style: titleStyle,
                  ),
                  new SizedBox(
                    height: 8.0
                  ),
                  new Text(place.desc, style: descStyle.copyWith(height: 1.5)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final TextStyle descStyle =
    const TextStyle(fontWeight: FontWeight.w500, color: Colors.black54, fontFamily: 'GoogleSans');
    final TextStyle titleStyle =
    const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, fontFamily: 'LemonMilk');



class Place implements Comparable<Place> {
  final String name;
  final String desc;
  final String type;
  final String image;
  Place({this.name, this.desc, this.type, this.image});

  @override
  int compareTo(Place other) => type.compareTo(other.type);
}
