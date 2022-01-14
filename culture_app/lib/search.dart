import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bottomNav.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Widget myMargin = Container(margin: const EdgeInsets.only(top: 10));

  List gernefilter = ["전체", '뮤지컬', "전시회", "버스킹"];
  List gernefilter1 = ["축제", "만들기 공방", "시사회"];
  List sortfilter = ["거리순", "인기순", "리뷰순", "별점순"];
  List artistfilter = ["전체", "음악가", "미술가", "디자이너"];

  void showFilter() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(margin: EdgeInsets.only(top: 5)),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.close),
                        )
                      ],
                    ),
                    Text("검색필터"),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (var item in gernefilter)
                            Chip(
                              label: Text(item),
                            )
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (var item in gernefilter1)
                          Chip(
                            label: Text(item),
                          )
                      ],
                    ),
                    Text("정렬기준"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (var item in sortfilter) Chip(label: Text(item))
                      ],
                    ),
                    Text("아티스트"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (var item in artistfilter) Chip(label: Text(item))
                      ],
                    ),
                    Chip(label: Text("배우"))

                    // for(int i = 0; i < gernefilter.length; i++) {
                    //   if(OverflowBar) {
                    //      row라인 overflow시에 줄바꿈을 하고싶다.
                    //   } else {

                    //   }
                    // }
                    // for (var item in gernefilter)
                    //   Container(
                    //       margin: EdgeInsets.all(5),
                    //       child: Chip(label: Text(item)))
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigate(),
        body: Column(
          children: [
            Container(margin: const EdgeInsets.only(top: 35)), //top margin
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    width: 20.w,
                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.only(right: 10),
                    child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back_ios))),
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
                        child: SearchTab(),
                      ),
                      InkWell(
                          onTap: () {
                            //search 결과화면으로 향합니다.
                          },
                          child: const Icon(Icons.search)),
                    ],
                  ),
                ),
                Container(
                    width: 20.0.w,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: InkWell(
                        onTap: () => showFilter(),
                        child: Icon(Icons.filter_alt))), //filter를 dialog
              ],
            ),
            Container(
              width: 355.w,
              child: Divider(
                height: 40.h,
                thickness: 2,
                color: Colors.grey,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("검색결과")],
            )
          ],
        ));
  }
}

class SearchTab extends StatefulWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    //Text를 남겨놓고 검색될수 있도록 수정 필요
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: const InputDecoration.collapsed(hintText: '검색어 입력'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270.w,
      height: 36.h,
      child: _buildTextComposer(),
    );
  }
}
