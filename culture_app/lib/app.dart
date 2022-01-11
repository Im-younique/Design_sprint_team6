import 'package:culture_app/bottomNav.dart';
import 'package:flutter/material.dart';

//Start App view
class CultureApp extends StatelessWidget {
  const CultureApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigate(),
      ),
    );
  }
}
