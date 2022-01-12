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
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 300),
            child: const SearchPostal(),
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
  final detailAddressController = TextEditingController();

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
                    postCode = result.postCode;
                    address = result.address;
                    latitude = result.latitude.toString();
                    longitude = result.longitude.toString();
                    kakaoLatitude = result.kakaoLatitude.toString();
                    kakaoLongitude = result.kakaoLongitude.toString();
                  });
                },
              ),
            ));
      },
      child: Column(
        children: [
          Text(
            '주소 검색하기',
            style: AddAppBar.textStyleSmall(),
          ),
          const Divider(),
          TextFeilds()
        ],
      ),
    );
  }
}

class TextFeilds extends StatefulWidget {
  const TextFeilds({Key? key}) : super(key: key);

  @override
  State<TextFeilds> createState() => _TextFeildsState();
}

class _TextFeildsState extends State<TextFeilds> {
  final detailAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(labelText: '주소', hintText: '주소'),
          ),
          TextField(
            controller: detailAddressController,
            decoration: InputDecoration(labelText: '상세 주소', hintText: '상세 주소'),
          ),
        ],
      ),
    );
  }
}
