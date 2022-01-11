import 'package:culture_app/addContent/appbar.dart';
import 'package:flutter/material.dart';
import 'package:kpostal/kpostal.dart';
import 'appbar.dart';

ButtonStyle buttonThema() {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10)),
  );
}

class AddLocation extends StatelessWidget {
  const AddLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget stack() {
      return Stack(
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
                  '등록할 컨텐츠가 있는\n위치를 알려주세요',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                )),
          ]),
          Container(
            child: SearchPostal(),
            margin: EdgeInsets.only(top: 300, left: 20),
          )
        ],
      );
    }

    return Scaffold(
      appBar: AddAppBar.appbar(),
      extendBodyBehindAppBar: true,
      body: stack(),
    );
  }
}

class SearchPostal extends StatefulWidget {
  const SearchPostal({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchPostal();
}

class _SearchPostal extends State<StatefulWidget> {
  String postCode = '-';
  String address = '-';
  String latitude = '-';
  String longitude = '-';
  String kakaoLatitude = '-';
  String kakaoLongitude = '-';
  @override
  Widget build(BuildContext context) {
    KpostalView(
      useLocalServer: true, // default is false
      localPort: 8080, // default is 8080
    );
    // TODO: implement build
    return ElevatedButton(
      style: buttonThema(),
      onPressed: () async {
        await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => KpostalView(
                callback: (Kpostal result) {
                  print(result.address);
                  setState(() {
                    this.postCode = result.postCode;
                    this.address = result.address;
                    this.latitude = result.latitude.toString();
                    this.longitude = result.longitude.toString();
                    this.kakaoLatitude = result.kakaoLatitude.toString();
                    this.kakaoLongitude = result.kakaoLongitude.toString();
                  });
                },
              ),
            ));
      },
      child: Text(
        '주소 검색하기',
        style: AddAppBar.textStyleSmall(),
      ),
    );
  }
}
