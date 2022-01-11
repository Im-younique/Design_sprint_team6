import 'package:flutter/material.dart';

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
    Widget lst = ListTile(
      title: Text(realtitle),
      trailing: const Icon(Icons.favorite_border),
      subtitle: Text(place + '\n' + period),
    );
    return Container(
      height: 140,
      child: Card(
        child: (Row(
          children: [
            Container(
              child: Image.asset(
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
