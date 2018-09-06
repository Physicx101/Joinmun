import 'package:joinmun/catalogue/catalogueItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatalogueView extends StatelessWidget {
  
  BuildContext context;
   @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return new Scaffold(
      backgroundColor: theme.backgroundColor,
      body: _buildCatalogue(),
    );

  }

   _buildCatalogue() {
     //Size screenSize = MediaQuery.of(context).size;
     return Container(
      color: Colors.grey[100],
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
            return _catalogueList(
            )[index];
        },
      ),
    );
  }

  _catalogueList() {
    return [
      CatalogueItem(
        name: "JOINMUN Totebag",
        price: "55.000",
        imageUrl:
            "https://static.wixstatic.com/media/3abaee_4e308b01c47044fa9bd01a3ccd2c8f9d~mv2.png/v1/fill/w_366,h_748,al_c,usm_0.66_1.00_0.01/3abaee_4e308b01c47044fa9bd01a3ccd2c8f9d~mv2.png",
      ),
      CatalogueItem(
        name: "Trump Totebag",
        price: "55.000",
        imageUrl:
            "https://static.wixstatic.com/media/3abaee_c993aa1874df443dbfb3f12ab2fee662~mv2.png/v1/fill/w_628,h_784,al_c,usm_0.66_1.00_0.01/3abaee_c993aa1874df443dbfb3f12ab2fee662~mv2.png",
      ),
      CatalogueItem(
        name: "JOINMUN T-Shirt",
        price: "80.000",
        imageUrl:
            "https://static.wixstatic.com/media/3abaee_30a9f26a0456422facdb8bf4454d9dcd~mv2.png/v1/fill/w_718,h_538,al_c,usm_0.66_1.00_0.01/3abaee_30a9f26a0456422facdb8bf4454d9dcd~mv2.png",
      ),
      CatalogueItem(
        name: "MUN Experience",
        price: "80.000",
        imageUrl:
            "https://static.wixstatic.com/media/3abaee_30d5a412c88b4cdfa31bb043a4c55f7e~mv2_d_2048_2048_s_2.png/v1/fill/w_626,h_628,al_c,usm_0.66_1.00_0.01/3abaee_30d5a412c88b4cdfa31bb043a4c55f7e~mv2_d_2048_2048_s_2.png",
      ),
      CatalogueItem(
        name: "Lunch Not Launch",
        price: "80.000",
        imageUrl:
            "https://static.wixstatic.com/media/3abaee_fc3614a801c74a938293e5a09054b374~mv2_d_2000_2000_s_2.png/v1/fill/w_616,h_616,al_c,usm_0.66_1.00_0.01/3abaee_fc3614a801c74a938293e5a09054b374~mv2_d_2000_2000_s_2.png",
      ),
       CatalogueItem(
        name: "Life of Kim",
        price: "80.000",
        imageUrl:
            "https://static.wixstatic.com/media/3abaee_a295001144444e7a92ef982ae9ccc16c~mv2_d_1524_1436_s_2.png/v1/fill/w_608,h_572,al_c,usm_0.66_1.00_0.01/3abaee_a295001144444e7a92ef982ae9ccc16c~mv2_d_1524_1436_s_2.png",
      ),
    ];
  }
  
}

