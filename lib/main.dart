import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ClockScreen(),
    );
  }
}

class ClockScreen extends StatefulWidget {
  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  late String _currentTime1;
  late String _currentTime2;
  late Timer _timer;
  
  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime());
    }
  
  
  void _updateTime() {
    setState(() {
      _currentTime1 = DateFormat('yyyy-MM-dd').format(DateTime.now());
      _currentTime2 = DateFormat('HH:mm:ss').format(DateTime.now());
      });  
  }
  
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("현재 시간")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('현재 시간은'),
            Text(
              _currentTime1,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              _currentTime2,
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ],
        ),
      ),
    );
  }
}
