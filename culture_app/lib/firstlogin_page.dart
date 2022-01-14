import 'package:culture_app/beforeStart.dart';
import 'package:culture_app/myPage/myPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'chat_screen.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class Firstlogin extends StatelessWidget {
  const Firstlogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyPage();
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Authentication(),
    );
  }
}

class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providerConfigs: [EmailProviderConfiguration()],
          );
        }
        return ChatScreen();
      },
    );
  }
}
