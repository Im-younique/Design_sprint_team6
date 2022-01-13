<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'search.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'bottomNav.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  CollectionReference frTest = FirebaseFirestore.instance.collection('test');
  Widget myMargin = Container(margin: const EdgeInsets.only(top: 10));

  @override
  Widget build(BuildContext context) {
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
                    //Expanded() 적용시 constraintsError 발생
                    //마찬가지로 때려넣으면 반응형으로 적응이 안되서,,
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
                      "BIG_Title",
                      style: Theme.of(context).textTheme.headline5,
                    )
                  ],
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                          children: List.generate(6, (index) {
                        return Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xff6667AB),
                                    //decoration_image: 대체
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0))),
                                width: 120.0,
                                height: 200.0,
                              ),
                              Text("__의 버스킹 $index")
                            ],
                          ),
                        );
                      })),
                    )),
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
                  width: 300.0,
                  height: 200.0,
                  //크기를 지정해줘야 오류가 없는데 반응형으로 나타나진 않음..
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                        "https://via.placeholder.com/288x188",
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: 10,
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
        width: 80.w,
        height: 80.h,
        child: FloatingActionButton(
          backgroundColor: Color(0xff6667AB),
          onPressed: () => {
            //homeMap 연결시키면 됩니다
          },
          child: Container(
              child: Icon(
            Icons.map,
            size: 30.w,
          )),
        ),
      ),
    );
  }
}
=======
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'search.dart';
import 'homeMap.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'bottomNav.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  CollectionReference frTest = FirebaseFirestore.instance.collection('test');
  Widget myMargin = Container(margin: const EdgeInsets.only(top: 10));

  @override
  Widget build(BuildContext context) {
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
                    //Expanded() 적용시 constraintsError 발생
                    //마찬가지로 때려넣으면 반응형으로 적응이 안되서,,
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
                      "BIG_Title",
                      style: Theme.of(context).textTheme.headline5,
                    )
                  ],
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                          children: List.generate(6, (index) {
                        return Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xff6667AB),
                                    //decoration_image: 대체
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0))),
                                width: 120.0,
                                height: 200.0,
                              ),
                              Text("__의 버스킹 $index")
                            ],
                          ),
                        );
                      })),
                    )),
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
                  width: 300.0,
                  height: 200.0,
                  //크기를 지정해줘야 오류가 없는데 반응형으로 나타나진 않음..
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                        "https://via.placeholder.com/288x188",
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: 10,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff6667AB),
        onPressed: () => {
          //homeMap 연결시키면 됩니다
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeMap()),)
          //homeMap 연결시키면 됩니다
        },
        child: Icon(Icons.map),
      ),
    );
  }
}
>>>>>>> c6a519eb6bc95a1b38507b24f222deb04d074ecb
