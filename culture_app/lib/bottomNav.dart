import 'package:flutter/material.dart';

class BottomNavigate extends StatefulWidget {
  const BottomNavigate({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<BottomNavigate> createState() => _BottomNavigate();
}

class _BottomNavigate extends State<BottomNavigate> {
  int _index = 0;
  //리스트안에 페이지 위젯을 넣으면 됩니다.
  List _page = [Text('1'), Text('2'), Text('3'), Text('4')];

  void _pageSelect(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Appcolor.mainColor),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '찜목록'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline), label: '컨텐츠등록'),
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity), label: '내정보')
          ],
          onTap: _pageSelect,
          currentIndex: _index,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
        ),
      ),
      body: _page.elementAt(_index),
    );
  }
}

class Appcolor {
  Appcolor(_);
  static Color mainColor = Color(0xff6667AB);
}
