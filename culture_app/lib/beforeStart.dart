import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


FirebaseFirestore firestore = FirebaseFirestore.instance;

const MaterialColor primaryWhite = MaterialColor(
  _whitePrimaryValue,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(_whitePrimaryValue),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);
const int _whitePrimaryValue = 0xFFFFFFFF;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '시작화면 폰트바 컬러?',
      theme: ThemeData(
        primarySwatch: primaryWhite,
      ),

      home: FirstRoute(),
    );
  }
}


//첫번째
class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.dstATop),
              image: NetworkImage(
                  "https://c.tenor.com/BB2RMMixnBoAAAAd/art.gif"),
              fit: BoxFit.cover
          ),
        ),
        child: Column(

          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            Container(
              margin: EdgeInsets.only(top: 250),
              child:
              Text("이종호님 환영합니다!",
                style: TextStyle(fontFamily: "cafe",
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Text("문찐이 아니라면 시작하세요",
              style: TextStyle(fontFamily: "cafe",
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
                onPressed: (){Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondRoute()));
                },
                child: Text('Start!', style: TextStyle(fontFamily: "cafe",
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold) ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}


//두번째
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.8), BlendMode.dstATop),
              image: NetworkImage(
                  "https://lh5.ggpht.com/phD-b-aUsdFQ7-nTBF7lqGOwOtvW6GOJJ2OSVtbJgdrTlp7X7_5z8yyeP92Q=s1200"),
              fit: BoxFit.cover
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children:<Widget> [
            Container(
              margin: EdgeInsets.only(top: 250),
              child:
              Text("당신은 누구인가요?",
                style: TextStyle(fontFamily: "cafe",
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Column(
                children: [
                  Container(
                  ),
                  ElevatedButton(
                    child: Text("참여자"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ThirdRoute()));
                    },
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    child: Text("제공자(개인)"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ThirdRoute()));
                    },
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    child: Text("제공자(기관)"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ThirdRoute()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//세번째
class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.8), BlendMode.dstATop),
              image: NetworkImage(
                  "https://cdn.shopify.com/s/files/1/0203/9334/files/Busking_Musicians_1024x1024.jpeg?v=1521795106"),
              fit: BoxFit.cover
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children:<Widget> [
            Container(
              margin: EdgeInsets.only(top: 250),
              child:
              Text("당신의 성별은 무엇입니까?",
                style: TextStyle(fontFamily: "cafe",
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Column(
                children: [
                  Container(
                  ),
                  ElevatedButton(
                    child: Text("남성"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FourthRoute()));
                    },
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    child: Text("여성"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FourthRoute()));
                    },
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    child: Text("기타"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FourthRoute()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//네번째
class FourthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.8), BlendMode.dstATop),
              image: NetworkImage(
                  "https://collectionapi.metmuseum.org/api/collection/v1/iiif/38251/1766386/main-image"),
              fit: BoxFit.cover
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start ,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget> [
            Container(
              margin: EdgeInsets.only(top: 250),
              child:
              Text("나이는 어떻게 되나요?",
                style: TextStyle(fontFamily: "cafe",
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildElevatedButton(context, '10대'),
                SizedBox(width: 20,),
                _buildElevatedButton(context, '20대'),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildElevatedButton(context, '30대'),
                SizedBox(width: 20,),
                _buildElevatedButton(context, '40대'),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildElevatedButton(context, '50대'),
                SizedBox(width: 20,),
                _buildElevatedButton(context, '60대'),
              ],
            ),
            SizedBox(height: 10,),
            _buildElevatedButton(context, '70대 이상'),
          ],
        ),
      ),
    );
  }

  Widget _buildElevatedButton(BuildContext context, String title) {
    return ElevatedButton(
      child: Text(title),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FifthRoute()));
      },
    );
  }
}

//다섯번째

class FifthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.8), BlendMode.dstATop),
              image: NetworkImage(
                  "https://www.rmg.co.uk/sites/default/files/styles/large/public/2021-09/California%20Dreamin%27%20NGC%201499%20%C2%A9%20Terry%20Hancock%20%7C%20Astronomy%20Photographer%20of%20the%20Year%202021%20Stars%20and%20Nebulae%20winner.jpeg?itok=roC6ZNmk"),
              fit: BoxFit.cover
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center ,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget> [
            Container(
              margin: EdgeInsets.only(top: 250),
              child:
              Text("어디에 사나요?",
                style: TextStyle(fontFamily: "cafe",
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildElevatedButton(context, '서울'),
                SizedBox(width: 20,),
                _buildElevatedButton(context, '부산'),
                SizedBox(width: 20,),
                _buildElevatedButton(context, '대구'),
                SizedBox(width: 20,),
                _buildElevatedButton(context, '인천'),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildElevatedButton(context, '광주'),
                SizedBox(width: 20,),
                _buildElevatedButton(context, '대전'),
                SizedBox(width: 20,),
                _buildElevatedButton(context, '울산'),
                SizedBox(width: 20,),
                _buildElevatedButton(context, '세종'),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildElevatedButton(context, '강원'),
                SizedBox(width: 20,),
                _buildElevatedButton(context, '경기'),
                SizedBox(width: 20,),
                _buildElevatedButton(context, '경남'),
                SizedBox(width: 20,),
                _buildElevatedButton(context, '경북'),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildElevatedButton(context, '전북'),
                SizedBox(width: 20,),
                _buildElevatedButton(context, '전남'),
                SizedBox(width: 20,),
                _buildElevatedButton(context, '충남'),
                SizedBox(width: 20,),
                _buildElevatedButton(context, '충북'),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildElevatedButton(context, '제주'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildElevatedButton(BuildContext context, String title) {
    return ElevatedButton(
      child: Text(title),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SixthRoute()));
      },
    );
  }
}
//여섯번째

class SixthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.dstATop),
              image: NetworkImage(
                  "https://www.museum.go.kr/relic_image/PS01001001/bon006/2016/1213161649247/700/bon006504-22-01.jpg"),
              fit: BoxFit.cover
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment:MainAxisAlignment.start,
          children: <Widget> [
            Container(
              margin: EdgeInsets.only(top: 250),
              child:
              Text("고생하셨습니다!",
                style: TextStyle(fontFamily: "cafe",
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 40,),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    child: Text("슬기로운 문화생활 시작!"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FifthRoute()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
