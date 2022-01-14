import 'package:flutter/material.dart';
import 'place_contents.dart';
import 'bottomNav.dart';

import 'jiyoung_detail.dart';
import 'jiyoung_contents.dart';
import 'jiyoung_review.dart';

class jiyoung_detail_main extends StatefulWidget {

  @override
  State<jiyoung_detail_main> createState() => _jiyoung_detail_mainState();
}

class _jiyoung_detail_mainState extends State<jiyoung_detail_main> {
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
                'http://ticketimage.interpark.com/rz/image/play/goods/poster/21/21012360_p_s.jpg',
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
                MaterialPageRoute(builder : (context) => jiyoung_detail()),
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
                MaterialPageRoute(builder : (context) => jiyoung_contents()),
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
                MaterialPageRoute(builder : (context) => jiyoung_review()),
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
        '기다림에 지친 나날들\n계속된 지루함에 다시 한번 용기를 내어봅니다\n\n저만의 플레이리스트로 고마움을 더하고 진한 울림을 담아 따스함이 건네어 질 수 있는 \n\n2022-22 백지영 전국투어 콘서트 <백허그>',
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
                    '백지영 전국투어 콘서트 <BAEK HUG>',
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
                    child: const Text('대전컨벤션센터(DCC)',
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
    child: Image.asset(
      'images/placephoto.jpg',
      width: 500,
      height: 183,
      fit: BoxFit.fill,
    ),
  );
}
// 타이틀섹션 함수로 만든거 끝
