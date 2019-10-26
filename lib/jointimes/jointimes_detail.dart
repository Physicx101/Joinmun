import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:joinmun_2019/model/post.dart';

class JointimesDetail extends StatelessWidget {
  static const String routeName = "/jointimes_detail";
  final Post post;

  JointimesDetail({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final format = new DateFormat('EEE, MMM dd • hh:mm a');

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 250.0,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: post.filePath.url,
                  child: new ConstrainedBox(
                    constraints: new BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height * 0.35),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: post.filePath.url,
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: Text(
                  post.judul,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.title.copyWith(
                      fontSize: 20, fontWeight: FontWeight.bold, height: 1.5),
                ),
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
                  child: Text(
                    format.format(DateTime.parse(post.updatedAt).toLocal()) +
                        " by " +
                        post.footer,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontSize: 14),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  post.message
                      .replaceAll("\\n", "\n\n")
                      .replaceAll("\\t", "\t\t"),
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontSize: 14, height: 1.5),
                ),
              ),
              /*Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    post.footer
                        .replaceAll("\\n", "\n\n")
                        .replaceAll("\\t", "\t\t"),
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontSize: 14),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
