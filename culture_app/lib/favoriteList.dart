import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:culture_app/contentCard.dart';
import 'package:culture_app/provider/favoriteProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bottomNav.dart';

//Start App view
class favoriteList extends StatelessWidget {
  favoriteList({Key? key}) : super(key: key);
  CollectionReference contentCards =
      FirebaseFirestore.instance.collection('contentCard');

  //일단은 contentCard에 있는거 다 불러오게 했습니다
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: contentCards.get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          List<contentCard> cards = [];
          var contents = snapshot.data!.docs.forEach((element) {
            cards.add((contentCard(element['realtitle'], element['img'],
                element['place'], element['period'])));
          });

          return Scaffold(
              bottomNavigationBar: BottomNavigate(),
              appBar: AppBar(
                centerTitle: true,
                title: const Text('찜 목록'),
              ),
              body: ListView(
                children: cards,
              ));
        }

        return Scaffold(
            bottomNavigationBar: BottomNavigate(),
            appBar: AppBar(
              centerTitle: true,
              title: const Text('찜 목록'),
            ),
            body: CircularProgressIndicator());
      },
    );
  }
}

//           contentCard('title', 'images/lake.jpg', 'location', '210103-220105'),
