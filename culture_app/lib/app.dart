import 'package:culture_app/contentCard.dart';
import 'package:culture_app/favoriteList.dart';
import 'package:flutter/material.dart';

//Start App view
class CultureApp extends StatelessWidget {
  const CultureApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          foregroundColor: Colors.black,
        ),
        primaryColor: Colors.white,
        accentColor: const Color(0x6666AB),
      ),
      home: favoriteList(),
    );
  }
}

//           contentCard('title', 'images/lake.jpg', 'location', '210103-220105'),
