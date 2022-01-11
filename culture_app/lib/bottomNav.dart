import 'package:flutter/material.dart';
import 'addContent/addContent.dart';

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
            Navigator.pushNamed(context, "/");
            break;
          case 1:
            Navigator.pushNamed(context, "/");
            break;
          case 2:
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddContent(),
                ));
            break;
          case 3:
            Navigator.pushNamed(context, "/");
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
