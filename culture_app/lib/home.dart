import 'dart:async';
import 'package:culture_app/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'search.dart';
import 'homeMap.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'bottomNav.dart';
import 'content.dart';
import 'jiyoung_detail_main.dart';
import 'jaewan_detail_main.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  Widget myMargin = Container(margin: const EdgeInsets.only(top: 10));
  List<String> adList = [
    "https://i.pinimg.com/564x/f5/86/23/f58623fe8765b80ce36966c5f0d207d6.jpg",
    "http://cdnimage.dailian.co.kr/news/202011/news_1605229225_936431_m_1.jpeg",
    "https://i.pinimg.com/736x/9c/18/50/9c1850e31d993169d20a2162e0b65ba2.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    //getImageData();
    return Scaffold(
      bottomNavigationBar: BottomNavigate(),
      body: Column(
        children: [
          Container(margin: const EdgeInsets.only(top: 35)), //top margin
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 20.w,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff6667AB), width: 2),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 5, top: 2, bottom: 4),
                      child: const Image(
                        image: AssetImage('images/logo.png'),
                      ),
                    ),
                    Container(
                      width: 260.0.w,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Search()));
                        },
                        child: const Icon(Icons.search)),
                  ],
                ),
              ),
              Container(
                width: 20.0.w,
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.80,
            child: ListView(
              padding: EdgeInsets.only(top: 2),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text("진행중"),
                    Text("반경 1KM"),
                    Text("대전 광역시 유성구 대학로 99"),
                  ],
                ),
                myMargin,
                Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                    ),
                    Text(
                      "추천 콘텐츠",
                      style: Theme.of(context).textTheme.headline5,
                    )
                  ],
                ),
                mytemp(),
                myMargin,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 110.w,
                          height: 50.h,
                          child: OutlinedButton(
                            child: Text("뮤지컬"),
                            onPressed: () => {},
                            //style: OutlineButton.styleFrom(), style적용안됨.
                          ),
                        ),
                        Container(
                          width: 110.w,
                          height: 50.h,
                          child: OutlinedButton(
                            child: Text("축제"),
                            onPressed: () => {},
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 110.w,
                          height: 50.h,
                          child: OutlinedButton(
                            child: Text("전시회"),
                            onPressed: () => {},
                          ),
                        ),
                        Container(
                          width: 110.w,
                          height: 50.h,
                          child: OutlinedButton(
                            child: Text("만들기 공방"),
                            onPressed: () => {},
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 110.w,
                          height: 50.h,
                          child: OutlinedButton(
                            child: Text("버스킹"),
                            onPressed: () => {},
                          ),
                        ),
                        Container(
                          width: 110.w,
                          height: 50.h,
                          child: OutlinedButton(
                            child: Text("시사회"),
                            onPressed: () => {},
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                myMargin,
                myMargin,
                Container(
                  width: 300.0.w,
                  height: 200.0.h,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                        adList[index],
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: 3,
                    viewportFraction: 0.8,
                    scale: 0.9,
                    itemWidth: 288.0,
                    itemHeight: 188.0,
                    control: SwiperControl(
                        color: Colors.white, padding: EdgeInsets.all(50.0)),
                    pagination: SwiperPagination(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(left: 2.0),
        width: 80.w,
        height: 80.h,
        child: FloatingActionButton(
          backgroundColor: Color(0xff6667AB),
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeMap()),
            )
          },
          child: Icon(Icons.map, size: 30.w),
        ),
      ),
    );
  }
}

Widget mytemp() {
  return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection('contentCard').get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("error");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          List<Widget> myScroll = [];
          snapshot.data!.docs.forEach((doc) {
            myScroll.add(Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        width: 110.w,
                        height: 210.0.h,
                        child: InkWell(
                            onTap: () {
                              if (doc['realtitle'] ==
                                  "백지영 전국투어 콘서트 <BAEK HUG>") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            jiyoung_detail_main()));
                              } else if (doc['realtitle'] == '이재완의 철학 콘서트') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            jaewan_detail_main()));
                              }
                            },
                            child:
                                Image.network(doc['img'], fit: BoxFit.fill))),
                    Container(
                      width: 110.w,
                      child: Text(doc['realtitle'],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 10.0.w,
                              overflow: TextOverflow.ellipsis)),
                    )
                  ],
                )));
          });

          return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(children: myScroll),
              ));
        }

        return Container(
          child: CircularProgressIndicator(),
        );
      });
}
