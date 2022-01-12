import 'package:culture_app/addContent/addAdditional.dart';
import 'package:culture_app/addContent/appbar.dart';
import 'package:flutter/material.dart';
import 'package:kpostal/kpostal.dart';
import 'appbar.dart';
import '../home.dart';

ButtonStyle buttonThema() {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10)),
  );
}

ButtonStyle buttonThema2() {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(AddAppBar.color()),
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
            margin: EdgeInsets.only(top: 300),
            height: MediaQuery.of(context).size.height * 0.7,
            color: Colors.white,
            child: Container(
                width: MediaQuery.of(context).size.width * 1,
                child: const SearchPostal()),
          ),
        ],
      );
    }

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
                  setState(() {
                    postCode = result.postCode;
                    address = result.address;
                    print(address);
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '주소 검색하기',
                style: AddAppBar.textStyleSmall(),
              ),
              Icon(
                Icons.search,
                color: AddAppBar.color(),
              )
            ],
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            child: Form(
              child: Container(
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: '주소'),
                      controller: TextEditingController(text: '${address}'),
                    ),
                    TextField(
                      controller: detailAddressController,
                      decoration: const InputDecoration(
                          labelText: '상세 주소', hintText: '상세 주소'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        style: buttonThema2(),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Additional()));
                        },
                        child: const Text(
                          '다음으로',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
