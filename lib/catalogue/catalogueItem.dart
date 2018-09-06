import 'package:flutter/material.dart';


class CatalogueItem extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;

  const CatalogueItem({Key key,
    this.name,
    this.price,
    this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildCatalogue(context),
      ],
    );
  }


  _buildCatalogue(BuildContext context) {
    var theme = Theme.of(context);
    return Material(
      child: Card(
        margin: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.network(
                imageUrl,
              ),
              height: 180.0,
              width: 360.0,
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(fontSize: 20.0, color: theme.primaryColor, fontFamily: 'LemonMilk', fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "\Rp $price",
                        style: TextStyle(fontSize: 18.0, color: theme.accentColor, fontFamily: 'LemonMilk', fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

