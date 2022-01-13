import 'package:flutter/material.dart';
import 'addContentCategory.dart';
import 'appbar.dart';
import '../home.dart';

class AddContent extends StatelessWidget {
  const AddContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: const NewWidget(),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _next() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddContentCategory(),
          ));
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Image.asset(
              'images/live-music.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                color: Colors.black54,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '간단하게 \n컨텐츠 등록하기',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '컨텐츠 등록하기를 통해 어쩌구 저쩌구\n 주변 이용자에게 홍보도 함께 하세요\n어쩌구 저쩌구',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.all(20.0)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AddAppBar.color())),
                        onPressed: _next,
                        child: const Text('시작하기'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
