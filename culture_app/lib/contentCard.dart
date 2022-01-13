import 'package:culture_app/provider/favoriteProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class contentCard extends StatelessWidget {
  String realtitle;
  String img;
  String place;
  String period;
  contentCard(this.realtitle, this.img, this.place, this.period, {Key? key})
      : super(key: key);
  //const contentCard({String title? title})

  @override
  Widget build(BuildContext context) {
    favoriteProvider _favorites = Provider.of<favoriteProvider>(context);
    Widget lst = ListTile(
      title: Text(realtitle),
      trailing: IconButton(
        padding: const EdgeInsets.all(0),
        alignment: Alignment.centerRight,
        icon: (_favorites.hasKey(realtitle)
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border)),
        onPressed: () {
          _favorites.toggleFavorite(realtitle, this);
        },
      ),
      subtitle: Text(place + '\n' + period),
    );
    return Container(
      height: 140,
      child: Card(
        child: (Row(
          children: [
            Container(
              child: Image.network(
                img,
                fit: BoxFit.fill,
                width: 130,
                height: 130,
              ),
              padding: const EdgeInsets.all(5),
            ),
            Expanded(
              child: lst,
            ),
          ],
        )),
        elevation: 6.0,
      ),
    );
  }
}
