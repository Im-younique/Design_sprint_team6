import 'package:culture_app/addContent/appbar.dart';
import 'package:culture_app/bottomNav.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';
import '../home.dart';

class Additional extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AddAppBar.appbar(IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Homepage(),
                ));
          },
          icon: Icon(Icons.clear))),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const SizedBox.expand(
            child: Image(
              image: AssetImage('images/category.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Container(
                padding: const EdgeInsets.only(left: 10, top: 10),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.8,
                color: Colors.black54,
                child: const Text(
                  '추가 설명을\n작성해 주세요',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                )),
          ]),
        ],
      ),
    );
  }
}
