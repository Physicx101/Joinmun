import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'dart:ui';


class Post implements Comparable<Post> {
  final String title;
  final String desc;
  final String image;

  Post({this.title, this.desc, this.image});

  @override
  int compareTo(Post other) => title.compareTo(other.title);
}

class JoinTimesPage extends StatefulWidget {
  @override
  _JoinTimesPageState createState() => new _JoinTimesPageState();
}

class _JoinTimesPageState extends State<JoinTimesPage> {
  List<Post> allPosts;
  StreamSubscription<QuerySnapshot> sub;

  @override
  void initState() {
    super.initState();

    final CollectionReference collection =
        Firestore.instance.collection('post');
    sub = collection.snapshots().listen((QuerySnapshot snapshot) {
      setState(() {
        allPosts = snapshot.documents.map(_toPosts).toList();
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
    final EdgeInsets mediaPadding = MediaQuery.of(context).padding;

    Widget _homeHeader() => Container(
          constraints: new BoxConstraints.expand(
            height: 200.0,
          ),
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('assets/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: new BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
            child: new Container(
              decoration:
                  new BoxDecoration(color: Colors.white.withOpacity(0.5)),
              child: new Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: new Container(
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new AssetImage('assets/banner.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );

    if (allPosts == null) {
      return new Scaffold(
        body: new Center(
          child: new CircularProgressIndicator(),
        ),
      );
    }

    final List<Post> listPosts = allPosts.toList();

    return new Scaffold(
      backgroundColor: Colors.white,
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
              expandedHeight: 220.0,
              flexibleSpace: FlexibleSpaceBar(
                background: _homeHeader(),
              )),
          new SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverFixedExtentList(
              itemExtent: 300.0,
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final Post post = listPosts[index];
                  return new PostCard(
                    post,
                  );
                },
                childCount: listPosts.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  

  Widget buildListForPosts(BuildContext context, Iterable<Post> posts) {
    final List<Post> listPosts = posts.toList();

    return new ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      itemCount: listPosts.length,
      itemBuilder: (BuildContext context, int index) {
        Post post = listPosts[index];
        return new PostCard(post);
      },
    );
  }

  static Post _toPosts(DocumentSnapshot snapshot) {
    return new Post(
      title: snapshot['title'],
      desc: snapshot['desc'],
      image: snapshot['image'],
    );
  }
}

class PostCard extends StatelessWidget {
  PostCard(this.post);

  static final double height = 322.0;

  final Post post;

  @override
  Widget build(BuildContext context) {
    Image image;

   

    if (post.image != null) {
      image = new Image.network(
        post.image,
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
            tag: post.title,
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
                  post.title ?? '',
                  style: titleStyle,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
                const Padding(padding: const EdgeInsets.only(top: 8.0)),
                new Text(
                  
                  post.desc ?? '',
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
      onTap: () => showPlacePage(context, post),
      child: new Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: card,
      ),
    );
  }

  void showPlacePage(BuildContext context, Post post) {
    Navigator.push(
      context,
      new MaterialPageRoute<Null>(
        settings: const RouteSettings(name: '/posts/post'),
        builder: (BuildContext context) {
          return new Theme(
            data: Theme.of(context),
            child: new PostPage(post),
          );
        },
      ),
    );
  }
}

class PostPage extends StatelessWidget {
  final Post post;

  PostPage(this.post);

  @override
  Widget build(BuildContext context) {
    Image image;

    if (post.image != null) {
      image = new Image.network(
        post.image,
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
                tag: post.title,
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
                    post.title,
                    style: titleStyle,
                  ),
                  new SizedBox(height: 8.0),
                  new Text(post.desc, style: descStyle.copyWith(height: 1.5)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final TextStyle descStyle = const TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.black54,
    fontFamily: 'Montserrat');
final TextStyle titleStyle = const TextStyle(
    fontSize: 20.0, fontWeight: FontWeight.w600, fontFamily: 'LemonMilk');
