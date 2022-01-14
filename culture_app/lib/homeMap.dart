import 'package:culture_app/bottomNav.dart';
import 'package:culture_app/home.dart';
import 'package:culture_app/place_detail_main.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'search.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class HomeMap extends StatefulWidget {
  const HomeMap({Key? key}) : super(key: key);

  @override
  _HomeMapState createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(36.366327, 127.345094); // 시립미술관 위치는 36.367039, 127.386317
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }


  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
        markerId: MarkerId("marker_1"),
        position: LatLng(36.366428, 127.383686),
        infoWindow: InfoWindow(
          title: "대전시립미술관",
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => place_detail_main()));
          },

        ),
      ),
      Marker(
        markerId: MarkerId("marker_1"),
        position: LatLng(36.366327, 127.345094),
        infoWindow: InfoWindow(
          title: "이재완의 철학 콘서트",
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => place_detail_main()));
          },

        ),
      ),

    ].toSet();
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
              zoom: 17.0,
            ),
            markers: _createMarker(),

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
                          color: Colors.white70,
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
                              width: 260.0.w,
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Search()));
                                },
                                child: const Icon(Icons.search)),
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
                        Card(
                          elevation: 4,
                          margin: EdgeInsets.only(bottom: 5),
                          color: Colors.white,
                          child: Container(
                            width: 120,
                            height: 40,
                            child: OutlinedButton(
                              child: Text("뮤지컬",style:TextStyle(color: Color(0xff6667AB),fontWeight: FontWeight.bold)),
                              onPressed: () => {},
                            ),
                          ),
                        ),

                        Card(
                          color: Colors.white,
                          elevation: 4,
                         child: Container(
                            width: 120,
                            height: 40,
                            child: OutlinedButton(
                              child: Text("축제",style:TextStyle(color: Color(0xff6667AB),fontWeight: FontWeight.bold)),
                              onPressed: () => {},
                            ),
                          ),
                        ),

                      ],
                    ),
                    Column(
                      children: [
                        Card(
                          margin: EdgeInsets.only(bottom: 5),
                          elevation: 4,
                          color: Colors.white,
                          child:Container(

                            width: 120,
                            height: 40,
                            child: OutlinedButton(
                              child: Text("전시회",style:TextStyle(color: Color(0xff6667AB),fontWeight: FontWeight.bold)),
                              onPressed: () => {},
                            ),
                          ),
                        ),

                        Card(
                          color:Colors.white,
                          elevation: 4,
                          child: Container(
                            width: 120,
                            height: 40,
                            child: OutlinedButton(
                              child: Text("만들기 공방",style:TextStyle(color: Color(0xff6667AB),fontWeight: FontWeight.bold)),
                              onPressed: () => {},
                            ),
                          ),
                        ),

                      ],
                    ),
                    Column(
                      children: [
                        Card(
                          elevation: 4,
                          margin: EdgeInsets.only(bottom: 5),
                          child:Container(
                            width: 120,
                            height: 40,
                            child: OutlinedButton(
                              child: Text("버스킹",style:TextStyle(color: Color(0xff6667AB),fontWeight: FontWeight.bold)),
                              onPressed: () => {},
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.white,
                          elevation: 4,
                          child: Container(
                            width: 120,
                            height: 40,
                            child: OutlinedButton(
                              child: Text("시사회",style:TextStyle(color: Color(0xff6667AB),fontWeight: FontWeight.bold)),
                              onPressed: () => {},
                            ),
                          ),

                        )

                      ],
                    ),
                  ],
                ), // 카테고리 영역
              ],
            ),
          ),
         ],
        ),
        floatingActionButton: Container(
          width: 80.w,
          height: 80.h,
          child:FloatingActionButton(
            backgroundColor: Color(0xff6667AB),
            onPressed: () => {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Homepage()),)
            },
            child: Icon(Icons.insert_drive_file,
            size: 30.w,),
          ),
        )
      ),
    );
  }
}