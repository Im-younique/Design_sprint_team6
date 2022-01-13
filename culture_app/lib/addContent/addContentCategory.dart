import 'package:flutter/material.dart';
import 'addLocation.dart';
import 'appbar.dart';
import '../home.dart';

class AddContentCategory extends StatelessWidget {
  const AddContentCategory({Key? key}) : super(key: key);

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
      body: selectCategory(),
    );
  }
}

List<String> categories = <String>['버스킹', '전시회', '연극', '뮤지컬', '시사회'];

ButtonStyle buttonThema() {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10)),
  );
}

class selectCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _categoryNext(index) {
      String value = categories[index];
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddLocation(
                    genre: value,
                  )));
    }

    // TODO: implement build
    return Scaffold(
      body: Stack(children: [
        const SizedBox.expand(
          child: Image(
            image: AssetImage('images/category.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Container(
                padding: EdgeInsets.only(left: 10, top: 10),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                color: Colors.black54,
                child: const Text(
                  '등록할 컨텐츠의\n종류를 알려주세요',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                )),
            Expanded(
              child: Container(
                  color: Colors.black54,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                            child: ElevatedButton(
                                style: buttonThema(),
                                onPressed: () {
                                  _categoryNext(index);
                                },
                                child: Text(
                                  '${categories[index]}',
                                  style: AddAppBar.textStyleBig(),
                                )));
                      },
                      padding: EdgeInsets.all(10),
                      itemCount: categories.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                            height: 10,
                          ))),
            ),
          ],
        )
      ]),
    );
  }
}
