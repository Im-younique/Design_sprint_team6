import 'package:culture_app/bottomNav.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeMap extends StatefulWidget {
  const HomeMap({Key? key}) : super(key: key);

  @override
  _HomeMapState createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigate(),
        body: Stack(children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
          Positioned(
            top: 40,
            child: Column(
              children: [
                Container(
                  // 검색창 영역
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
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
                            const Icon(Icons.search),
                          ],
                        ),
                      ),
                      Container(margin: const EdgeInsets.only(right: 20)),
                    ],
                  ),
                ), // 검색창 영역
                Row(
                  // 카테고리 영역
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          width: 120,
                          height: 40,
                          child: OutlinedButton(
                            child: Text("뮤지컬"),
                            onPressed: () => {},
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
                          margin: EdgeInsets.only(bottom: 5),
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
                          margin: EdgeInsets.only(bottom: 5),
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
                ), // 카테고리 영역
              ],
            ),
          ),
         ],
        ),
      ),
    );
  }
}