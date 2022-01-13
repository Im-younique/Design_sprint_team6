import 'package:flutter/material.dart';
import 'place_detail_main.dart';
import 'place_detail.dart';
import 'place_reviews.dart';
import 'place_contents.dart';

class place_detail_main extends StatefulWidget {

  @override
  State<place_detail_main> createState() => _place_detail_mainState();
}

class _place_detail_mainState extends State<place_detail_main> {
  int viewindex = 0;
  @override
  Widget build(BuildContext context) {
    Color color = Color(0xff6667AB);
      print('1234');
      return Scaffold(
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
                child: Image.asset(
                  'images/lake.jpg',
                  width: 117,
                  height: 130,
                  fit: BoxFit.fill,
                ),
              ),
            )
          ]));

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
                MaterialPageRoute(builder : (context) => place_detail()),
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
                MaterialPageRoute(builder : (context) => place_contents()),
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
                MaterialPageRoute(builder : (context) => place_reviews()),
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
          '여기다가는 상세정보를 넣으면 될거같아요',
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
                    '대전시립미술관',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: const Text(
                    '미술관/서구',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: const Text('서구 만년동 둔산대로 155',
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
      'images/lake2.jpg',
      width: 500,
      height: 183,
      fit: BoxFit.fill,
    ),
  );
}
// 타이틀섹션 함수로 만든거 끝
