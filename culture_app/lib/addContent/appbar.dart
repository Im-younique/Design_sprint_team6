import 'package:culture_app/home.dart';
import 'package:flutter/material.dart';

class AddAppBar {
  static AppBar appbar(IconButton iconButton) {
    return AppBar(
      backgroundColor: Colors.transparent,
      //아이콘 홈으로 가는 걸로 설정해야함
      actions: [
        iconButton
        // IconButton(
        //   icon: Icon(Icons.clear),
        //   onPressed: () {},
        // )
      ],
      elevation: 0,
    );
  }

  static Color color() {
    return Color(0xff6667AB);
  }

  static TextStyle textStyleSmall() {
    return TextStyle(fontSize: 20, color: Color(0xff6667AB));
  }

  static TextStyle textStyleBig() {
    return TextStyle(fontSize: 30, color: Color(0xff6667AB));
  }
}
