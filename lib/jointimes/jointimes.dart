import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'dart:ui';

class Post implements Comparable<Post> {
  final String title;
  final String content;
  final String image;
  final String author;
  final String date;

  Post({this.title, this.content, this.image, this.author, this.date});

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
              expandedHeight: 180.0,
              flexibleSpace: FlexibleSpaceBar(
                background: _homeHeader(),
              )),
          new SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverFixedExtentList(
              itemExtent: 170.0,
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
          )
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
      content: snapshot['content'],
      image: snapshot['image'],
      author: snapshot['author'],
      date: snapshot['date'],
    );
  }
}

class PostCard extends StatelessWidget {
  PostCard(this.post);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () => showPostPage(context, post),
      child: new Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
        child: Card(
          elevation: 0.0,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          post.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              fontFamily: 'Montserrat'),
                        ),
                        flex: 3,
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: 80.0,
                          width: 80.0,
                          child: Hero(
                            tag: post.title,
                            child: new ClipRRect(
                                child: Image.network(
                                  post.image,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: new BorderRadius.circular(8.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          post.author,
                          style: TextStyle(
                              fontSize: 18.0, fontFamily: 'Montserrat'),
                        ),
                        Text(
                          post.date,
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat'),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showPostPage(BuildContext context, Post post) {
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
    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          new SliverToBoxAdapter(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: new Text(
                    post.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        fontFamily: 'Montserrat'),
                  ),
                ),
                new SizedBox(height: 8.0),
                Hero(
                  tag: post.title,
                  child: new Image.network(
                    post.image,
                    fit: BoxFit.fitWidth,
                    height: 200.0,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: new Text(post.content,
                      style: descStyle.copyWith(height: 1.5)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final TextStyle descStyle = const TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.black87,
    fontFamily: 'Montserrat');
final TextStyle titleStyle = const TextStyle(
    fontSize: 20.0, fontWeight: FontWeight.w600, fontFamily: 'LemonMilk');
