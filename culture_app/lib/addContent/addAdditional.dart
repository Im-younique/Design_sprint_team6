import 'package:culture_app/addContent/addContent.dart';
import 'package:culture_app/addContent/addLocation.dart';
import 'package:time_range/time_range.dart';
import 'package:culture_app/addContent/appbar.dart';
import 'package:culture_app/addContent/complete.dart';
import 'package:culture_app/bottomNav.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';
import '../home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

ButtonStyle buttonThema2() {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(AddAppBar.color()),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
  );
}

class Additional extends StatefulWidget {
  Additional({Key? key, required this.address}) : super(key: key);
  final List<String> address;
  @override
  State<Additional> createState() => _AdditionalState();
}

class _AdditionalState extends State<Additional> {
  static Color color = AddAppBar.color();
  TimeRangeResult timeResult = TimeRangeResult(
      TimeOfDay(hour: 12, minute: 30), TimeOfDay(hour: 12, minute: 30));

  String title = "";
  String detail = "";

  final titleController = TextEditingController();
  final detailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.addListener(() {
      title = titleController.text;
      titleController.value = titleController.value.copyWith(
        text: title,
      );
    });
    super.initState();
    detailController.addListener(() {
      detail = detailController.text;
      detailController.value = detailController.value.copyWith(text: detail);
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  DateTime first = DateTime.now();
  DateTime second = DateTime.now();
  @override
  Widget build(BuildContext context) {
    List<String> list = widget.address;
    CollectionReference content =
        FirebaseFirestore.instance.collection('contentCard');

    Future<void> addContent() {
      return content
          .add({
            'gerne': '${list[2]}',
            'period':
                '${first.year}.${first.month}.${first.day}-${second.year}.${second.month}.${second.day}',
            'realtitle': '${title}',
            // 'time':
            //     '${timeResult.start.hour}:${timeResult.start.minute}-${timeResult.end.hour}: ${timeResult.end.minute}',
            'place': '${list[0]} ${list[1]}',
          })
          .then((value) => print("add complete"))
          .catchError((error) => {print("failed")});
    }

    // TODO: implement build
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
      // resizeToAvoidBottomInset: false,
      body: Stack(
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
                color: Colors.black54,
                child: const Text(
                  '추가 설명을\n작성해 주세요',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                )),
          ]),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35),
            color: Colors.white,
            child: ListView(
              children: [
                TextField(
                  controller: TextEditingController(
                      text:
                          '${first.year}/${first.month}/${first.day}~${second.year}/${second.month}/${second.day}'),
                  decoration: InputDecoration(labelText: '날짜', hintText: '날짜'),
                ),
                TextButton(
                  onPressed: () {
                    selectDate();
                  },
                  child: Text(
                    '날짜 선택',
                    style: TextStyle(
                        color: AddAppBar.color(), fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(thickness: 1.5),
                Text(
                  '시간 ${timeResult.start.format(context)}-${timeResult.end.format(context)}',
                  style: AddAppBar.textStyleSmall(),
                ),
                const SizedBox(
                  height: 5,
                ),
                TimeRange(
                    borderColor: color,
                    activeBackgroundColor: color,
                    backgroundColor: Colors.white,
                    fromTitle: Text('Start'),
                    toTitle: Text('End'),
                    firstTime: TimeOfDay(hour: 00, minute: 30),
                    lastTime: TimeOfDay(hour: 23, minute: 30),
                    timeBlock: 30,
                    timeStep: 30,
                    onRangeCompleted: (range) => setState(() {
                          timeResult = range!;
                        })),
                Divider(
                  thickness: 1.5,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: titleController,
                  decoration:
                      InputDecoration(labelText: '컨텐츠 이름', hintText: '컨텐츠 이름'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  decoration:
                      InputDecoration(labelText: '간략한 설명', hintText: '간략한 설명'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: buttonThema2(),
                    onPressed: () {
                      addContent();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Complete(),
                          ));
                    },
                    child: const Text(
                      '등록하기',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> selectDate() async {
    DateTime? pickedDate = await showDatePicker(
        helpText: '시작 날짜',
        context: context,
        initialDate: first,
        firstDate: DateTime(2022),
        lastDate: DateTime(2024));
    DateTime? pickedSecondDate = await showDatePicker(
        helpText: '종료 날짜',
        context: context,
        initialDate: first,
        firstDate: DateTime(2022),
        lastDate: DateTime(2024));

    if (pickedDate != null &&
        pickedDate != first &&
        pickedSecondDate != null &&
        pickedSecondDate != second) {
      setState(() {
        first = pickedDate;
        second = pickedSecondDate;
      });
    }
  }
}
