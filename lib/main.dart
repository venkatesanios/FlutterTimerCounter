import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timer_count/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  CounterTimer? _counterTimer;
  int _counter = 0;
  TextEditingController startvalue = TextEditingController();
  TextEditingController stopvalue = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _startTimer();
    _initializeTimer();
  }

  void _initializeTimer() {
    _counterTimer = CounterTimer(
      start: 0,
      end: 0,
      intervalMs: 500,
      onTick: (value) {
        setState(() {
          _counter = value;
        });
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _stopTimer();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 100,
              child: TextField(
                controller: startvalue,
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              width: 100,
              child: TextField(
                controller: stopvalue,
                onChanged: (value) {},
              ),
            ),
            Text(
              ' value is ${startvalue.text} to ${stopvalue.text} ',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton.icon(
                onPressed: () {
                  _counter = int.parse(startvalue.text);
                  _stopTimer();
                  _startTimer();
                  _updateInterval(startvalue.text, stopvalue.text, 100);
                },
                label: Text('Start'))
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
