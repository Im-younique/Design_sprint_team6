import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Widget myMargin = Container(margin: const EdgeInsets.only(top: 10));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: SearchTab(), //Text("검색이라는 hint가 들어간다."),
                  ),
                  InkWell(onTap: () {}, child: const Icon(Icons.search)),
                ],
              ),
            ),
            Container(
                width: 20.0.w,
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Icon(Icons.filter_alt)),
          ],
        ),
        Divider(
          height: 40.h,
          thickness: 2,
          color: Colors.grey,
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
      height: 30.h,
      child: _buildTextComposer(),
    );
  }
}

class SearchFilter extends StatefulWidget {
  const SearchFilter({Key? key}) : super(key: key);

  @override
  _SearchFilterState createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
