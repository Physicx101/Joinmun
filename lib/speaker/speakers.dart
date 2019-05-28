import 'package:flutter/material.dart';

class Speaker {
  final String fullName;
  final String avatarImg;
  final String bio;

  const Speaker({this.fullName, this.avatarImg, this.bio});
}

const List<Speaker> speakersList = const <Speaker>[
  const Speaker(
    fullName: 'Sudarno Sumarto',
    avatarImg: 'assets/speaker1.jpg',
    bio:
        """Sudarno Sumarto is the Policy Advisor for the National Team of Poverty Reduction Acceleration (TNP2K), Office of the Vice President of the Republic of Indonesia. He is also a senior research fellow at the SMERU Research Institute, Jakarta. He received his PhD and an MA from Vanderbilt University all in economics.  Prior to joining Policy Adviser for TNP2K, he was the Shorenstein APARC fellow in the year of 2009 to 2010, the team leader and economist at World Bank, Center for Policy and Implementation Studies (CPIS), as well as Asian Development Bank (ADB). Sudarno Sumarto has contributed to more than sixty co-authored articles, reports, and working papers regarding development economics.""",
  ),
  const Speaker(
      fullName: 'H.E Hassan Wirajuda',
      avatarImg: 'assets/speaker2.jpg',
      bio:
          """H.E Hassan Wirajuda is an Indonesian politician who was the Minister of Foreign Affairs of Indonesia from 2001 to 2009. He served during the presidencies of Megawati Sukarnoputri and Susilo Bambang Yudhoyono. Wirajuda earned a Doctor of Juridical Science in International Law from the University of Virginia School of Law. Earned a Master of Law (LL.M) from Harvard University School of Law (1985), and a Master of Arts in Law and Diplomacy (MALD) from the Fletcher School of Law and Diplomacy at Tufts University (1984).

In 1971, he graduated from the Faculty of Law of the University of Indonesia and in 1976, he spent a year at Oxford University in the United Kingdom earning a Certificate in Diplomacy.In 2007, he chaired the first Indonesia-UK forum alongside British foreign minister Margaret Beckett. During his diplomatic career, Mr. Wirajuda also assisted the establishment of the Indonesian National Commission on Human Rights (Komnas HAM).
"""),
  const Speaker(
      fullName: 'Oliver Lacey-Hall',
      avatarImg: 'assets/speaker3.jpg',
      bio:
          """Mr. Oliver Lacey-Hall is currently Regional Director for Asia and the Pacific for the United Nations Office for the Coordination of Humanitarian Affairs (OCHA) where he has oversight of OCHA’s operations across Asia and the Pacific.

Previous work experience includes humanitarian coordination and response work in China, Viet Nam, Indonesia, Iraq, Croatia, Armenia and the Democratic People's Republic of Korea with the UN High Commissioner for Refugees (UNCHR), the UN Development Programme (UNDP), the Organization for Security and Cooperation in Europe (OSCE) and the European Commission. Prior to taking up his current post in March 2011, he was Deputy Director of OCHA’s Communications and Information Services Branch in New York. 

He has 25 years’ experience in humanitarian work, with an initial focus on refugee issues followed by coordination and communications work, mixed with project and programme management.
""")
];

final TextStyle nameStyle = const TextStyle(
    fontWeight: FontWeight.w700, fontSize: 20.0, fontFamily: 'Montserrat');

final TextStyle descStyle = const TextStyle(
    fontSize: 14.0,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
    color: Colors.black54,
    height: 1.5);

class SpeakersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return new Container(
        child: new ListView.builder(
            itemCount: speakersList.length,
            padding: const EdgeInsets.all(8.0),
            itemBuilder: (context, index) {
              final Speaker speaker = speakersList[index];
              return new SpeakersCard(speaker);
            }));
  }
}

class SpeakersCard extends StatelessWidget {
  SpeakersCard(this.speaker);

  final Speaker speaker;
  @override
  Widget build(BuildContext context) {
    final EdgeInsets mediaPadding = MediaQuery.of(context).padding;
    return new GestureDetector(
      onTap: () => openSpeakersPage(context, speaker),
      child: new Card(
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Hero(
                  tag: speaker.avatarImg,
                  child: new ClipRRect(
                    borderRadius: new BorderRadius.circular(8.0),
                    child: new Image.asset(
                      speaker.avatarImg,
                      height: 188.0,
                      fit: BoxFit.cover,
                    ),
                  )),
              new SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text(
                      speaker.fullName,
                      style: nameStyle,
                    ),
                    new Text(
                      speaker.bio,
                      style: descStyle,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openSpeakersPage(BuildContext context, Speaker speaker) {
    Navigator.push(
      context,
      new MaterialPageRoute<Null>(
        settings: const RouteSettings(name: 'remarks'),
        builder: (BuildContext context) {
          return new Theme(
            data: Theme.of(context),
            child: new SpeakerDetail(speaker),
          );
        },
      ),
    );
  }
}

class SpeakerDetail extends StatelessWidget {
  SpeakerDetail(this.speaker);

  final Speaker speaker;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final descriptionTextStyle = theme.textTheme.body1.copyWith(
      fontFamily: 'CenturyGothic',
      height: 1.95,
    );

    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: 200.0,
            backgroundColor: Colors.transparent,
            flexibleSpace: new FlexibleSpaceBar(
              background: new Hero(
                tag: speaker.avatarImg,
                child: new Image.asset(
                  speaker.avatarImg,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          new SliverToBoxAdapter(
            child: new Padding(
              padding: new EdgeInsets.all(16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new SizedBox(
                    height: 8.0,
                  ),
                  new Text(
                    speaker.fullName,
                    style: nameStyle,
                  ),
                  new SizedBox(
                    height: 8.0,
                  ),
                  new Text(speaker.bio, style: descStyle),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
