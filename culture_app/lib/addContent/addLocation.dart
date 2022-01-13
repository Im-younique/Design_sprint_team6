import 'package:culture_app/addContent/addAdditional.dart';
import 'package:culture_app/addContent/addContentCategory.dart';
import 'package:culture_app/addContent/appbar.dart';
import 'package:flutter/material.dart';
import 'package:kpostal/kpostal.dart';
import 'appbar.dart';
import '../home.dart';

ButtonStyle buttonThema() {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
  );
}

ButtonStyle buttonThema2() {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(AddAppBar.color()),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(10)),
  );
}

class AddLocation extends StatefulWidget {
  const AddLocation({Key? key, required this.genre}) : super(key: key);
  final String genre;

  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  String postCode = '-';
  String address = '-';
  String detailLocation = '';

  final detailAddressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    detailAddressController.addListener(() {
      detailLocation = detailAddressController.text;
      detailAddressController.value = detailAddressController.value.copyWith(
        text: detailLocation,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    String category = widget.genre;
    KpostalView(
      useLocalServer: true, // default is false
      localPort: 8080, // default is 8080
    );

    void onTap() {
      List<String> list = [address, detailLocation, category];
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Additional(
                    address: list,
                  )));
    }

    Widget stack() {
      return Stack(
        children: [
          const SizedBox.expand(
            child: Image(
              image: AssetImage('images/category.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          ListView(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Expanded(
              flex: 2,
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  color: Colors.black54,
                  child: const Text(
                    '등록할 컨텐츠가 있는\n위치를 알려주세요',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  )),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 600,
                color: Colors.white,
                child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
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
                                      decoration:
                                          InputDecoration(labelText: '주소'),
                                      controller:
                                          TextEditingController(text: address),
                                      enabled: false,
                                    ),
                                    TextField(
                                      controller: detailAddressController,
                                      decoration: const InputDecoration(
                                          labelText: '상세 주소',
                                          hintText: '상세 주소'),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    ElevatedButton(
                                        style: buttonThema2(),
                                        onPressed: () {
                                          onTap();
                                        },
                                        child: const Text(
                                          '다음으로',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
            ),
          ]),
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
