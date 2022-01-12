import 'package:flutter/material.dart';
import 'bottomNav.dart';

class place_detail extends StatelessWidget {

  Widget build(BuildContext context) {

    Color color = Color(0xff6667AB);

    return MaterialApp(
      title: 'place_detail',
      home: Scaffold(
        body: ListView(
          children: [
            titleSection(),
            buttonSection(),
            textSection(),
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
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
          Text(
            'DETAIL',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          Text(
              'ㅣ',
              style: TextStyle(
                color: Colors.white,
              )
          ),
          Text(
            'CONTENTS',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          Text(
              'ㅣ',
              style: TextStyle(
                color: Colors.white,
              )
          ),
          Text(
            'REVIEW',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
        ],
      ),
    );
  }
  // 버튼섹션 함수 끝

  // 텍스트섹션 함수로 만듦
  Widget textSection (){
    return Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        '여기다가는 크롤링해온 정보를 넣으면 돼요 상세정보',
        style: TextStyle(
          color: Colors.black87,
          fontSize: 15,
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

          Image.asset(
            'images/lake.jpg',
            width: 117,
            height: 116,
            fit: BoxFit.fill,
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
