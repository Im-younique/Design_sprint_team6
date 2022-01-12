import 'package:culture_app/addContent/appbar.dart';
import 'package:culture_app/addContent/complete.dart';
import 'package:culture_app/bottomNav.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';
import '../home.dart';

ButtonStyle buttonThema2() {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(AddAppBar.color()),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
  );
}

class Additional extends StatefulWidget {
  @override
  State<Additional> createState() => _AdditionalState();
}

class _AdditionalState extends State<Additional> {
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
      // resizeToAvoidBottomInset: false,
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
                color: Colors.black54,
                child: const Text(
                  '추가 설명을\n작성해 주세요',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                )),
          ]),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35),
            color: Colors.white,
            child: ListView(
              children: [
                const TextField(
                  decoration: InputDecoration(labelText: '날짜', hintText: '날짜'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('날짜 선택'),
                ),
                const TextField(
                  decoration: InputDecoration(labelText: '시간', hintText: '시간'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  decoration:
                      InputDecoration(labelText: '컨텐츠 이름', hintText: '컨텐츠 이름'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  decoration:
                      InputDecoration(labelText: '간략한 설명', hintText: '간략한 설명'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: buttonThema2(),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Complete(),
                          ));
                    },
                    child: const Text(
                      '등록하기',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
