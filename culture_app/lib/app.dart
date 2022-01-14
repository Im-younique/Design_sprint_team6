import 'package:culture_app/bottomNav.dart';
import 'package:culture_app/contentCard.dart';
import 'package:culture_app/favoriteList.dart';
import 'package:culture_app/provider/favoriteProvider.dart';
import 'package:culture_app/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homeMap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firstlogin_page.dart';

//Start App view
class CultureApp extends StatefulWidget {
  const CultureApp({Key? key}) : super(key: key);

  @override
  State<CultureApp> createState() => _CultureAppState();
}

class _CultureAppState extends State<CultureApp> {
  bool isLogin = false;
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('no login');
      } else {
        setState(() {
          isLogin = true;
        });
      }
    });
    isLoading = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      builder: () => MaterialApp(
          title: 'Culture_app',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              color: Colors.white,
              foregroundColor: Colors.black,
            ),
            primaryColor: Colors.white,
            fontFamily: 'SpoqaHanSansNeo',
            accentColor: const Color(0x6666AB),
          ),
          home: !isLoading
              ? Container()
              : isLogin
                  ? Homepage()
                  : Firstlogin()),
    );
  }
}

//           contentCard('title', 'images/lake.jpg', 'location', '210103-220105'),
