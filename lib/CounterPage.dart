import 'package:flutter/material.dart';
import 'package:timer_count/counter.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  CounterTimer? _counterTimer;

  @override
  void initState() {
    super.initState();
    _initializeTimer();
  }

  void _initializeTimer() {
    _counterTimer = CounterTimer(
      start: _counter,
      end: 20,
      intervalMs: 500,
      onTick: (value) {
        setState(() {
          _counter = value;
        });
      },
    );
  }

  void _startTimer() {
    _counterTimer?.startTimer();
  }

  void _stopTimer() {
    _counterTimer?.stopTimer();
  }

  void _updateInterval(String startTime, String endTime, int newIntervalMs) {
    _counterTimer?.updateInterval(
        int.parse(startTime), int.parse(endTime), newIntervalMs);
  }

  // void _updateRange(int newStart, int newEnd) {
  //   _counterTimer?.updateRange(newStart, newEnd);
  //   setState(() {
  //     _counter = newStart;
  //   });
  // }

  @override
  void dispose() {
    _counterTimer?.stopTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_counter',
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _startTimer,
                  child: Text('Start'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _stopTimer,
                  child: Text('Stop'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _updateInterval('12', '24', 100),
                  child: Text('Faster'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _updateInterval('12', '24', 1000),
                  child: Text('Slower'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _updateInterval('5', '15', 100),
                  child: Text('Range 5-15'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _updateInterval('10', '30', 100),
                  child: Text('Range 10-30'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
