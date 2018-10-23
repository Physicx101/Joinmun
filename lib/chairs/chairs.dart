import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class Chair implements Comparable<Chair> {
  final String name;
  final String institute;
  final String chair;
  final String bio;
  final String image;
  Chair({this.name, this.institute, this.chair, this.bio,  this.image});

  @override
  int compareTo(Chair other) => chair.compareTo(other.chair);
}

class ChairPage extends StatefulWidget {
  @override
  _ChairPageState createState() => new _ChairPageState();
}

class _ChairPageState extends State<ChairPage> {
  List<Chair> allChairs;
  StreamSubscription<QuerySnapshot> sub;

  @override
  void initState() {
    super.initState();

    final CollectionReference collection =
        Firestore.instance.collection('chair');
    sub = collection.snapshots().listen((QuerySnapshot snapshot) {
      setState(() {
        allChairs = snapshot.documents.map(_toChairs).toList();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    sub?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    if (allChairs == null) {
      return new Scaffold(
        body: new Center(
          child: new CircularProgressIndicator(),
        ),
      );
    }
    return new Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0),
              child: Text(
                'SPECPOL',
                style: new TextStyle(fontFamily: 'LemonMilk', fontSize: 18.0),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(4.0),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              childAspectRatio: 0.75,
              children: _createChairCard(
                context,
                allChairs
                    .where((Chair chair) => chair.chair == 'specpol')
                    .toList()
                      ..sort(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0),
              child: Text(
                'UNHRC',
                style: new TextStyle(fontFamily: 'LemonMilk', fontSize: 18.0),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(4.0),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              childAspectRatio: 0.75,
              children: _createChairCard(
                context,
                allChairs
                    .where((Chair chair) => chair.chair == 'unhrc')
                    .toList()
                      ..sort(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0),
              child: Text(
                'G20',
                style: new TextStyle(fontFamily: 'LemonMilk', fontSize: 18.0),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(4.0),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              childAspectRatio: 0.75,
              children: _createChairCard(
                context,
                allChairs.where((Chair chair) => chair.chair == 'g20').toList()
                  ..sort(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0),
              child: Text(
                'UNFCCC',
                style: new TextStyle(fontFamily: 'LemonMilk', fontSize: 18.0),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(4.0),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              childAspectRatio: 0.75,
              children: _createChairCard(
                context,
                allChairs
                    .where((Chair chair) => chair.chair == 'unfccc')
                    .toList()
                      ..sort(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0),
              child: Text(
                'UNSC',
                style: new TextStyle(fontFamily: 'LemonMilk', fontSize: 18.0),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(4.0),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              childAspectRatio: 0.75,
              children: _createChairCard(
                context,
                allChairs.where((Chair chair) => chair.chair == 'unsc').toList()
                  ..sort(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0),
              child: Text(
                'PCA',
                style: new TextStyle(fontFamily: 'LemonMilk', fontSize: 18.0),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(4.0),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              childAspectRatio: 0.75,
              children: _createChairCard(
                context,
                allChairs.where((Chair chair) => chair.chair == 'pca').toList()
                  ..sort(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0),
              child: Text(
                'IPI',
                style: new TextStyle(fontFamily: 'LemonMilk', fontSize: 18.0),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(4.0),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              childAspectRatio: 0.75,
              children: _createChairCard(
                context,
                allChairs.where((Chair chair) => chair.chair == 'ipi').toList()
                  ..sort(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _createChairCard(BuildContext context, Iterable<Chair> chairs) {
    List<Widget> widgets = [];
    final List<Chair> listChairs = chairs.toList();
    for (var i = 0; i < listChairs.length; i++) {
      Chair chair = listChairs[i];
      Widget speakerCard = ChairCard(chair);
      widgets.add(speakerCard);
    }
    return widgets;
  }

  static Chair _toChairs(DocumentSnapshot snapshot) {
    return new Chair(
      name: snapshot['name'],
      institute: snapshot['institute'],
      chair: snapshot['chair'],
      bio: snapshot['bio'],
      image: snapshot['image'],
    );
  }
}

class ChairCard extends StatelessWidget {
  final Chair chair;

  ChairCard(this.chair);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 0.0,
        color: Colors.white,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Hero(
                    tag: chair,
                    child: ClipOval(
                      child: new Image.network(
                        chair.image,
                        height: 100.0,
                        width: 100.0,
                        fit: BoxFit.cover,
                      ),
                    )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    children: <Widget>[
                      Text(
                        chair.name,
                        style: nameStyle,
                      ),
                      SizedBox(
                        height: 8.0
                      ),
                      Text(
                        chair.institute,
                        style: instStyle,
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) {
            return SpeakerDetail(chair);
          },
        ));
      },
    );
  }
}

class SpeakerDetail extends StatelessWidget {
  final Chair chair;

  SpeakerDetail(this.chair);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: ListView(
        children: <Widget>[
          _buildAvatarImage(context),
          _buildTitle(context),
          _buildOrganizationChip(context),
          _buildBio(context)
        ],
      ),
    );
  }

  Widget _buildAvatarImage(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16.0),
      height: 200.0,
      width: 200.0,
      child: Center(
        child: Hero(tag: chair, child: AvatarFadeImage(chair.image)),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          chair.name,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }

  Widget _buildOrganizationChip(BuildContext context) {
    return Center(
      child: Text(
          chair.institute,
          style: instStyle.copyWith(fontSize: 16.0,color: Colors.black)
        ),
    );
  }

   Widget _buildBio(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text(
        chair.bio,
        style: bioStyle,
      ),
    );
  }
}

class AvatarFadeImage extends StatelessWidget {
  final String imageUrl;

  AvatarFadeImage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: FadeInImage.assetNetwork(
        placeholder: 'assets/avatar_placeholder.png',
        fit: BoxFit.contain,
        image: imageUrl,
      ),
    );
  }
}

final TextStyle nameStyle = const TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
    color: Colors.black,
    fontSize: 14.0);
final TextStyle instStyle = const TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
    color: Colors.black54);
    final TextStyle bioStyle = const TextStyle(
    fontSize: 14.0,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
    color: Colors.black54,
    height: 1.5);
