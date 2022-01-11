import 'package:culture_app/contentCard.dart';
import 'package:flutter/material.dart';

//Start App view
class favoriteList extends StatelessWidget {
  const favoriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favorites = <contentCard>[];
    favorites.add(
        contentCard('realtitle', 'images/lake.jpg', 'place', '210101-220105'));
    favorites.add(
        contentCard('realtitle', 'images/lake.jpg', 'place', '210101-220105'));

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('찜 목록'),
        ),
        body: ListView(
          children: favorites,
        ));
  }
}

//           contentCard('title', 'images/lake.jpg', 'location', '210103-220105'),
