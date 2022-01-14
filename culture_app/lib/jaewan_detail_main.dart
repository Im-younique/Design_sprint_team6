import 'package:flutter/material.dart';
import 'place_contents.dart';
import 'bottomNav.dart';

import 'jaewan_detail.dart';
import 'jaewan_contents.dart';
import 'jaewan_review.dart';

class jaewan_detail_main extends StatefulWidget {

  @override
  State<jaewan_detail_main> createState() => _jaewan_detail_mainState();
}

class _jaewan_detail_mainState extends State<jaewan_detail_main> {
  int viewindex = 0;
  @override
  Widget build(BuildContext context) {
    Color color = Color(0xff6667AB);
    print('1234');
    return Scaffold(
        bottomNavigationBar: BottomNavigate(),
        body: Stack(children: [
          ListView(
            children: [
              titleSection(),
              infoSection(),
              buttonSection(),
              contentSection(),
            ],
          ),
          Positioned(
            top: 90,
            left: 30,
            child: Card(
              elevation: 5,
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Plato_Silanion_Musei_Capitolini_MC1377.jpg/213px-Plato_Silanion_Musei_Capitolini_MC1377.jpg',
                width: 117,
                height: 130,
                fit: BoxFit.fill,
              ),
            ),
          ),Positioned(
            top: 15,
            left: 5,
            child:backSection(),
          )
        ],
        ));

  }


  Widget backSection (){
    return Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Color(0xff6667AB),
              iconSize: 25,
              onPressed: (){
                Navigator.pop(context);
              },
            ),]
        )
    );
//뒤로가기끝


  }
  // 버튼섹션 함수로 바꿨음
  Widget buttonSection() {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff2F305E),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.black, width: 3)),
      height: 35,
      width: 337,
      margin: EdgeInsets.only(right: 30, left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder : (context) => jaewan_detail()),
              );

            },
            child: Text('DETAIL'),
          ),
          Text('ㅣ',
              style: TextStyle(
                color: Colors.white,
              )),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder : (context) => jaewan_contents()),
              );
            },
            child: Text('CONTENTS'),
          ),
          Text('ㅣ',
              style: TextStyle(
                color: Colors.white,
              )),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder : (context) => jaewan_review()),
              );
            },
            child: Text('REVIEW'),
          ),
        ],
      ),
    );
  }

  // 버튼섹션 함수 끝
  Widget contentSection() {
    // 1이면 ~~ 2이면 ~~ 3이면 ~~
    return Container(
      padding: EdgeInsets.all(32),
      child: Text(
        '서양 철학에 대해 다룹니다.\n철학의 탄생으로부터 플라톤까지 스토리텔링기법으로 재미있게 강의합니다.',
        style: TextStyle(
          color: Colors.black87,
          fontSize: 15,
        ),
        softWrap: true,
      ),
    );

  }

// 텍스트섹션 함수로 만든거 끝
  Widget infoSection() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 30, top: 100, bottom: 30),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: const Text(
                    '이재완의 철학 콘서트',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: const Text(
                    '콘서트',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: const Text('충남대학교 막걸리동산',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                        )))
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red,
          ),
          Text('1234'),
        ],
      ),
    );
  }
}

// 타이틀섹션 함수로 만듦
Widget titleSection() {
  return Container(
    child: Image.network(
      'https://mblogthumb-phinf.pstatic.net/MjAxNzA1MjFfMjYz/MDAxNDk1MzY3NjIwMDk0.N2lb8iFGLe4KNNQmS_WoVyRGvpcz32trH3n6CfjKFrwg.PjC9SL53682VQy-Z9mJZIRDEc6zyTOq-rlitMfbcwpIg.JPEG.leetjd46/image_6043514981495367601407.jpg?type=w800',
      width: 500,
      height: 183,
      fit: BoxFit.fill,
    ),
  );
}
// 타이틀섹션 함수로 만든거 끝
