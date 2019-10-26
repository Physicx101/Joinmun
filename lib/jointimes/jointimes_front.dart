import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:joinmun_2019/config/index.dart';
import 'package:joinmun_2019/jointimes/jointimes_detail.dart';

import 'index.dart';

class JointimesFront extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _jointimesBloc = JointimesBloc();
    var state = _jointimesBloc.currentState as JointimesLoaded;
    var post = state.postData.posts;
    post..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) =>
            ConfigBloc().darkModeOn
                ? Divider(color: Colors.white54)
                : Divider(color: Colors.black12),
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        itemCount: post.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JointimesDetail(
                      post: post[index],
                    ),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Hero(
                      tag: post[index].filePath.url,
                      child: CachedNetworkImage(
                          imageUrl: post[index].filePath.url ?? '',
                          imageBuilder: (context, imageProvider) => Container(
                                width: 92.0,
                                height: 92.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(5.0),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
                              ),
                          placeholder: (context, url) => Container(),
                          errorWidget: (context, url, error) => Container()),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            post[index].judul,
                            style: Theme.of(context).textTheme.title.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5,
                                ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            post[index].footer,
                            style:
                                Theme.of(context).textTheme.caption.copyWith(
                                      fontSize: 14,
                                    ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            _timeAgo(DateTime.parse(post[index].updatedAt)),
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  static String _timeAgo(DateTime oldDate) {
    Duration diff = DateTime.now().difference(oldDate);
    if (diff.inDays > 365)
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
    if (diff.inDays > 30)
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
    if (diff.inDays > 7)
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
    if (diff.inDays > 0)
      return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
    if (diff.inHours > 0)
      return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
    if (diff.inMinutes > 0)
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
    return "just now";
  }
}
