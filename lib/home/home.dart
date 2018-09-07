import 'package:flutter/material.dart';

class socialMedia {
  const socialMedia({
    this.name,
    this.logo,
  });

  final String name;
  final String logo;
}

const List<socialMedia> socialMediaList = const <socialMedia>[
  const socialMedia(
    name: "Facebook",
    logo: "assets/ic_fb.png",
  ),
  const socialMedia(
    name: "Instagram",
    logo: "assets/ic_ig.png",
  ),
  const socialMedia(
    name: "Twitter",
    logo: "assets/ic_twitter.png",
  ),
];

final TextStyle titleStyle = const TextStyle(
    fontSize: 24.0, fontWeight: FontWeight.w500, fontFamily: 'LemonMilk');

final TextStyle nameStyle = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    fontFamily: 'CenturyGothic');


final TextStyle descStyle = const TextStyle(
    fontSize: 14.0, fontFamily: 'CenturyGothic', fontWeight: FontWeight.w500, height: 1.95);

class HomeView extends StatelessWidget {

  Size deviceSize;

  Widget _homeHeader() => Container(
        height: 200.0,
        width: double.infinity,
        child: Image.asset(
          'assets/img_drawer_header.png',
          fit: BoxFit.cover,
        ),
      );

  Widget _welcomingRemarks(BuildContext context) => Container(
          child: new GestureDetector(
        onTap: () => openRemarks(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: new Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Hero(
                    tag: 'welcome',
                    child: new ConstrainedBox(
                      constraints: new BoxConstraints(maxHeight: 230.0),
                      child: new Image.asset(
                        'assets/fakhri.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text(
                          "Welcoming Remarks",
                          style: titleStyle,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                        new SizedBox(
                          height: 8.0,
                        ),
                        new Text(
                          "Muhammad Fakhri Abdurrahman",
                          style: nameStyle,
                        ),
                        const Padding(padding: const EdgeInsets.only(top: 8.0)),
                        new Text(
                          """A very warm welcome to all of you, delegates!                  
Your presence in this year’s Jogjakarta International Model United Nations will not go waste for sure. The committee and I are excited to welcome you and give you the best experience in MUN and in Yogyakarta. All our services, including this mobile app, are specifically designed to ensure your comfort and convenience throughout the conference. This year, we will challenge all of you to delightful debates and negotiations while also providing you with the best that Yogyakarta has to offer. Make sure you enjoy the best of JOINMUN and Yogyakarta while you are here and don’t forget to have loads of fun.
Warm Regards,
Muhammad Fakhri Abdurrahman
President of Jogja International Model United Nations 2018
                    """,
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
        ),
      ));

  void openRemarks(BuildContext context) {
    Navigator.push(
      context,
      new MaterialPageRoute<Null>(
        settings: const RouteSettings(name: 'remarks'),
        builder: (BuildContext context) {
          return new Theme(
            data: Theme.of(context),
            child: new RemarksPage(),
          );
        },
      ),
    );
  }

  Widget _buildSocialMedia(BuildContext ctx, int index) {
    var socialMedia = socialMediaList[index];
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 20.0),
      child: new Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(socialMedia.logo),
            backgroundColor: Colors.transparent,
            radius: 28.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              socialMedia.name,
              style: new TextStyle(
                  fontFamily: 'LemonMilk',
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var textTheme = Theme.of(context).textTheme;

    final descriptionTextStyle = theme.textTheme.body1.copyWith(
      height: 1.95,
    );

    return new Scaffold(
      body: new SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _homeHeader(),
            new SizedBox(
              height: 8.0,
            ),
            _welcomingRemarks(context),
            new SizedBox(
              height: 8.0,
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Social Media',
                    style:
                        new TextStyle(fontFamily: 'LemonMilk', fontSize: 16.0),
                  ),
                ),
                Card(
                  child: SizedBox.fromSize(
                    size: const Size.fromHeight(120.0),
                    child: ListView.builder(
                      itemCount: socialMediaList.length,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(16.0),
                      itemBuilder: _buildSocialMedia,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RemarksPage extends StatelessWidget {


  RemarksPage();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final descriptionTextStyle = theme.textTheme.body1.copyWith(fontFamily: 'CenturyGothic',
      height: 1.95,
    );

    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: 250.0,
            backgroundColor: Colors.transparent,
            flexibleSpace: new FlexibleSpaceBar(
              background: new Hero(
                tag: 'welcome',
                child: new Image.asset(
                  'assets/fakhri.jpg',
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
                  new Text(
                    "Welcoming Remarks",
                    style: titleStyle,
                  ),
                  new SizedBox(
                    height: 8.0,
                  ),
                  new Text(
                    "Muhammad Fakhri Abdurrahman",
                    style: nameStyle,
                  ),
                  new SizedBox(
                    height: 8.0,
                  ),
                  new Text("""A very warm welcome to all of you, delegates!
                                  
Your presence in this year’s Jogjakarta International Model United Nations will not go waste for sure. The committee and I are excited to welcome you and give you the best experience in MUN and in Yogyakarta. All our services, including this mobile app, are specifically designed to ensure your comfort and convenience throughout the conference. This year, we will challenge all of you to delightful debates and negotiations while also providing you with the best that Yogyakarta has to offer. Make sure you enjoy the best of JOINMUN and Yogyakarta while you are here and don’t forget to have loads of fun.  
               
Warm Regards,
Muhammad Fakhri Abdurrahman
President of Jogja International Model United Nations 2018
                    """, style: descStyle),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
