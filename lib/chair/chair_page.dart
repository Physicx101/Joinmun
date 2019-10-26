import 'package:flutter/material.dart';
import 'package:joinmun_2019/chair/chair_list.dart';
import 'package:joinmun_2019/model/chair.dart';
import 'package:joinmun_2019/home/index.dart';
import 'package:joinmun_2019/universal/joinmun_scaffold.dart';

class ChairPage extends StatelessWidget {
  static const String routeName = "/chairs";
  List<Chair> chairs;

  @override
  Widget build(BuildContext context) {
    var _homeBloc = HomeBloc();
    var state = _homeBloc.currentState as InHomeState;
    var chairStream = state.chairs;

    return JoinmunScaffold(
      title: "Chairs",
      body: StreamBuilder(
          stream: chairStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              chairs = snapshot.data.documents
                  .map<Chair>((doc) => Chair.fromMap(doc.data))
                  .toList();
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Joint Crisis Committee",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      ..._createChairCard(
                        context: context,
                        chairs: chairs
                            .where(
                                (c) => c.chairGroup == "Joint Crisis Committee")
                            .toList()
                              ..sort((a, b) => a.chairId.compareTo(b.chairId)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            "United Nations Security Council (UNSC)",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      ..._createChairCard(
                        context: context,
                        chairs: chairs
                            .where((c) =>
                                c.chairGroup ==
                                "United Nations Security Council (UNSC)")
                            .toList()
                              ..sort((a, b) => a.chairId.compareTo(b.chairId)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            "International Criminal Tribunal for the Former Yugoslavia (ICTY)",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      ..._createChairCard(
                        context: context,
                        chairs: chairs
                            .where((c) =>
                                c.chairGroup ==
                                "International Criminal Tribunal for the Former Yugoslavia (ICTY)")
                            .toList()
                              ..sort((a, b) => a.chairId.compareTo(b.chairId)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Press Corps",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      ..._createChairCard(
                        context: context,
                        chairs: chairs
                            .where((c) => c.chairGroup == "Press Corps")
                            .toList()
                              ..sort((a, b) => a.chairId.compareTo(b.chairId)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            "United Nations Development Programme",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      ..._createChairCard(
                        context: context,
                        chairs: chairs
                            .where((c) =>
                                c.chairGroup ==
                                "United Nations Development Programme")
                            .toList()
                              ..sort((a, b) => a.chairId.compareTo(b.chairId)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Association of the South East Asia Nations",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      ..._createChairCard(
                        context: context,
                        chairs: chairs
                            .where((c) => c.chairGroup == "Association of the South East Asia Nations")
                            .toList()
                              ..sort((a, b) => a.chairId.compareTo(b.chairId)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Disarmament of the International Security Committee",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle
                                .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      ..._createChairCard(
                        context: context,
                        chairs: chairs
                            .where((c) => c.chairGroup == "Disarmament of the International Security Committee")
                            .toList()
                          ..sort((a, b) => a.chairId.compareTo(b.chairId)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            "International Labour Organisation",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle
                                .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      ..._createChairCard(
                        context: context,
                        chairs: chairs
                            .where((c) => c.chairGroup == "International Labour Organisation")
                            .toList()
                          ..sort((a, b) => a.chairId.compareTo(b.chairId)),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

List<Widget> _createChairCard({BuildContext context, Iterable<Chair> chairs}) {
  List<Widget> widgets = [];
  final List<Chair> listChairs = chairs.toList();
  for (var i = 0; i < listChairs.length; i++) {
    Chair chair = listChairs[i];
    Widget speakerCard = ChairList(
      chair: chair,
    );
    widgets.add(speakerCard);
  }
  return widgets;
}
