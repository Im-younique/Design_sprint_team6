import 'package:culture_app/home.dart';
import 'package:flutter/material.dart';

//Start App view
class CultureApp extends StatelessWidget {
  const CultureApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Culture_app',
      home: Homepage(),
    );
  }
}
