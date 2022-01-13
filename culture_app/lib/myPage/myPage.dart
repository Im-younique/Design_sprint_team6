import 'package:culture_app/addContent/appbar.dart';
import 'package:flutter/material.dart';
import '../bottomNav.dart';

class Mypage extends StatelessWidget {
  const Mypage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigate(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '내 정보',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 80,
                  color: AddAppBar.color(),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.all(10),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text(
                              '이',
                              style: TextStyle(color: Colors.black),
                            ),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '이재완',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                          Text(
                            '@jjjjj',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.account_circle,
                      size: 30,
                    ),
                    title: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('개인정보', style: TextStyle(fontSize: 20)),
                          Text('개인정보 수정하기', style: TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.pan_tool,
                      size: 30,
                    ),
                    title: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('신고하기', style: TextStyle(fontSize: 20)),
                          Text('등록된 허위 정보 신고하기',
                              style: TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.alarm,
                      size: 30,
                    ),
                    title: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('알림 설정', style: TextStyle(fontSize: 20)),
                          Text('알림을 보내도 될까요?', style: TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('로그아웃', style: TextStyle(fontSize: 20)),
                          Text('로그아웃 하기', style: TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('More'),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.movie_filter),
                    title: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('내 컨텐츠 보기', style: TextStyle(fontSize: 20)),
                          Text('내가 등록한 컨텐츠 보기', style: TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.chat),
                    title: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('내 리뷰 보기', style: TextStyle(fontSize: 20)),
                          Text('내가 작성한 리뷰 보기', style: TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
