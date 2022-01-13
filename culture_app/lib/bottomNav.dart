import 'package:culture_app/favoriteList.dart';
import 'package:culture_app/home.dart';
import 'package:culture_app/provider/favoriteProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'addContent/addContent.dart';
import 'myPage/myPage.dart';

class BottomNavigate extends StatelessWidget {
  const BottomNavigate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Appcolor.mainColor,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '찜목록'),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline), label: '컨텐츠등록'),
        BottomNavigationBarItem(icon: Icon(Icons.perm_identity), label: '내정보')
      ],
      onTap: (_index) {
        switch (_index) {
          case 0:
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Homepage(),
                ));
            break;
          case 1:
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => favoriteList(),
                ));
            break;
          case 2:
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddContent(),
                ));
            break;
          case 3:
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Mypage(),
                ));
            break;
        }
      },
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
    );
  }
}

class Appcolor {
  Appcolor(_);
  static Color mainColor = Color(0xff6667AB);
}
