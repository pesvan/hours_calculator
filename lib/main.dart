import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorkTime',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Working Time Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _hours_1 = 8;
  int _minutes_1 = 0;

  int _hours_2 = 8;
  int _minutes_2 = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: Colors.blue.shade100),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NumberPicker(
                      infiniteLoop: true,
                      minValue: 0,
                      maxValue: 23,
                      value: _hours_1,
                      onChanged: (value) => setState(() {
                        _hours_1 = value;
                      }),
                    ),
                    NumberPicker(
                      infiniteLoop: true,
                      minValue: 0,
                      maxValue: 59,
                      value: _minutes_1,
                      onChanged: (value) => setState(() {
                        _minutes_1 = value;
                      }),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.amber.shade100),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NumberPicker(
                      infiniteLoop: true,
                      minValue: 0,
                      maxValue: 23,
                      value: _hours_2,
                      onChanged: (value) => setState(() {
                        _hours_2 = value;
                      }),
                    ),
                    NumberPicker(
                      infiniteLoop: true,
                      minValue: 0,
                      maxValue: 59,
                      value: _minutes_2,
                      onChanged: (value) => setState(() {
                        _minutes_2 = value;
                      }),
                    ),
                  ],
                ),
              ),
              Text(addTimeAndToString())
            ],
          ),
        ),
      ),
    );
  }

  String addTimeAndToString() {
    final dateTime1 = DateTime(0, 0, 0, _hours_1, _minutes_1);
    DateTime result =
        dateTime1.add(Duration(hours: _hours_2, minutes: _minutes_2));
    String minuteStr =
        result.minute < 10 ? "0${result.minute}" : "${result.minute}";
    return "${result.hour}:$minuteStr";
  }
}
