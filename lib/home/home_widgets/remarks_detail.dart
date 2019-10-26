import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:joinmun_2019/model/place.dart';
import 'package:joinmun_2019/universal/joinmun_scaffold.dart';
import 'package:joinmun_2019/utils/joinmun.dart';
import 'package:joinmun_2019/utils/tools.dart';

class RemarksDetail extends StatelessWidget {
  static const String routeName = "/remarks_detail";
  final String name;
  final String _salu_image =
      "https://firebasestorage.googleapis.com/v0/b/joinmun-864f5.appspot.com/o/salu_image.JPG?alt=media&token=45c87c12-26ce-4d2a-9d97-a776159d6286";
  final String _kayla_image =
      "https://firebasestorage.googleapis.com/v0/b/joinmun-864f5.appspot.com/o/kayla_image.JPG?alt=media&token=70c24c60-2a95-4c9a-ab9f-4b94a88764f5";

  RemarksDetail({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return JoinmunScaffold(
      title: "Welcoming Remarks",
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: name == "Salu"
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    Joinmun.remarks_salu_name,
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    height: 5,
                                    color: Tools.hexToColor(
                                        Joinmun.joinmun_color_7),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                Joinmun.remarks_salu_role,
                                style: Theme.of(context).textTheme.subtitle,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                Joinmun.remarks_salu_faculty,
                                style: Theme.of(context).textTheme.caption,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                Joinmun.remarks_ugm,
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.expand(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                          child: Hero(
                            tag: name,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: _salu_image,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ConstrainedBox(
                          constraints: BoxConstraints.expand(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                          child: Hero(
                            tag: name,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: _kayla_image,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    Joinmun.remarks_kayla_name,
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    height: 5,
                                    color: Tools.hexToColor(
                                        Joinmun.joinmun_color_3),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                Joinmun.remarks_kayla_role,
                                style: Theme.of(context).textTheme.subtitle,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                Joinmun.remarks_kayla_faculty,
                                style: Theme.of(context).textTheme.caption,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                Joinmun.remarks_ugm,
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                  name == "Salu"? Joinmun.remarks_salu_text : Joinmun.remarks_kayla_text,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.caption.copyWith(fontSize: 14, height: 1.5),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
