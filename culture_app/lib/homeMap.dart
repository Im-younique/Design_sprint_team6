import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: 120,
                    height: 40,
                    child: OutlinedButton(
                      child: Text("뮤지컬"),
                      onPressed: () => {},
                      //style: OutlineButton.styleFrom(), style적용안됨.
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 40,
                    child: OutlinedButton(
                      child: Text("축제"),
                      onPressed: () => {},
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 120,
                    height: 40,
                    child: OutlinedButton(
                      child: Text("전시회"),
                      onPressed: () => {},
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 40,
                    child: OutlinedButton(
                      child: Text("만들기 공방"),
                      onPressed: () => {},
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 120,
                    height: 40,
                    child: OutlinedButton(
                      child: Text("버스킹"),
                      onPressed: () => {},
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 40,
                    child: OutlinedButton(
                      child: Text("시사회"),
                      onPressed: () => {},
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff6667AB), width: 2),
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 5, top: 2, bottom: 4),
                  child: const Image(
                    image: AssetImage('images/logo.png'),
                  ),
                ),
                Container(
                  width: 290.0,
                ),
                //Expanded() 적용시 constraintsError 발생
                //마찬가지로 때려넣으면 반응형으로 적응이 안되서,,
                const Icon(Icons.search),
              ],
            ),
          ),
          Container(margin: const EdgeInsets.only(right: 20)),
        ],
        ),
      ),
    );
  }
}