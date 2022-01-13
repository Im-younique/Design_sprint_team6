import 'package:time_range/time_range.dart';
import 'package:culture_app/addContent/appbar.dart';
import 'package:culture_app/addContent/complete.dart';
import 'package:culture_app/bottomNav.dart';
import 'package:flutter/material.dart';
import 'appbar.dart';
import '../home.dart';

ButtonStyle buttonThema2() {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(AddAppBar.color()),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
  );
}

class Additional extends StatefulWidget {
  @override
  State<Additional> createState() => _AdditionalState();
}

class _AdditionalState extends State<Additional> {
  static Color color = AddAppBar.color();
  TimeRangeResult timeResult = TimeRangeResult(
      TimeOfDay(hour: 12, minute: 30), TimeOfDay(hour: 12, minute: 30));

  DateTime first = DateTime.now();
  DateTime second = DateTime.now();
  @override
  Widget build(BuildContext context) {
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
                const TextField(
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
        context: context,
        initialDate: first,
        firstDate: DateTime(2022),
        lastDate: DateTime(2024));
    DateTime? pickedSecondDate = await showDatePicker(
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
