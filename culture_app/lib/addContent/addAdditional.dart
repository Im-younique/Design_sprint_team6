import 'package:culture_app/addContent/appbar.dart';
import 'package:culture_app/bottomNav.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';
import '../home.dart';

class Additional extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AddAppBar.appbar(IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Homepage(),
                ));
          },
          icon: Icon(Icons.clear))),
      bottomNavigationBar: BottomNavigate(),
    );
  }
}
