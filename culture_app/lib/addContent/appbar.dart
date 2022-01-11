import 'package:flutter/material.dart';

class AddAppBar {
  static AppBar appbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      //아이콘 홈으로 가는 걸로 설정해야함
      actions: [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {},
        )
      ],
      elevation: 0,
    );
  }

  static TextStyle textStyleSmall() {
    return TextStyle(fontSize: 20, color: Color(0xff6667AB));
  }

  static TextStyle textStyleBig() {
    return TextStyle(fontSize: 30, color: Color(0xff6667AB));
  }
}
