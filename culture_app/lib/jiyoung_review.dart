import 'package:flutter/material.dart';
import 'place_detail_main.dart';
import 'place_detail.dart';
import 'place_reviews.dart';
import 'place_contents.dart';
import 'bottomNav.dart';
import 'jiyoung_detail.dart';
import 'jiyoung_contents.dart';
import 'jiyoung_detail_main.dart';
import 'jiyoung_review.dart';

class jiyoung_review extends StatefulWidget {

  @override
  State<jiyoung_review> createState() => _jiyoung_reviewState();
}

class _jiyoung_reviewState extends State<jiyoung_review> {

  Route _createRoute1() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => jiyoung_detail(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route _createRoute2() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => jiyoung_contents(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {

    Color color = Color(0xff6667AB);

    return Scaffold(
      bottomNavigationBar: BottomNavigate(),
      body: ListView(
        children: [
          backSection(),
          titleSection(),
          buttonSection(),
          contentSection(),
        ],
      ),

    );

  }

  int viewindex = 1;

  //뒤로가기 ㅇㅇ
  Widget backSection (){
    return Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Color(0xff6667AB),
              iconSize: 25,
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => jiyoung_detail_main()),
                );
              },
            ),]
        )
    );
//뒤로가기끝


  }
  // 버튼섹션 함수로 바꿨음
  Widget buttonSection (){
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff2F305E),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.black, width:3)),
      height: 35,
      width: 337,
      margin: EdgeInsets.only(right: 30, left: 30),



      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ), onPressed: () {
            Navigator.of(context).push(_createRoute1());


          },
            child: Text('DETAIL'),
          ),
          Text(
              'ㅣ',
              style: TextStyle(
                color: Colors.white,
              )
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ), onPressed: () {
            Navigator.of(context).push(_createRoute2());


          },
            child: Text('CONTENTS'),
          ),
          Text(
              'ㅣ',
              style: TextStyle(
                color: Colors.white,
              )
          ),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ), onPressed: () {

          },
            child: Text('REVIEW'),
          ),
        ],
      ),
    );
  }

  // 버튼섹션 함수 끝
  Widget contentSection (){
    return Container(
      padding: EdgeInsets.all(32),
      child: Text(
        '재밌어요!!~',
        style: TextStyle(
          color: Colors.black87,
          fontSize: 30,
        ),
        softWrap: true,
      ),
    );


  }

// 텍스트섹션 함수로 만든거 끝
  Widget titleSection (){
    return Container(
      padding: const EdgeInsets.only(left:30,right:30,top:50,bottom:30),
      child: Row(
        children: [
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
          ),


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
                  padding: const EdgeInsets.only(left:20),
                  child: const Text(
                    '미술관/서구',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(left:20,top:20),
                    child: const Text(
                        '서구 만년동 둔산대로 155',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                        ))
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
