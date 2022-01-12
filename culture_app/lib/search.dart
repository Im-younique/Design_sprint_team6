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
        Container(margin: const EdgeInsets.only(top: 35)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 20.w,
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
                    width: 260.0.w,
                  ),
                  //Expanded() 적용시 constraintsError 발생
                  //마찬가지로 때려넣으면 반응형으로 적응이 안되서,,
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Search()));
                      },
                      child: const Icon(Icons.search)),
                ],
              ),
            ),
            Container(
              width: 20.0.w,
            ),
          ],
        ),
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
      child: TextField(
        controller: _textController,
        onSubmitted: _handleSubmitted,
        decoration: const InputDecoration.collapsed(hintText: 'Send a message'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildTextComposer(),
    );
  }
}
