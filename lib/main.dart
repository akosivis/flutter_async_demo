import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FlutterAsyncDemo(),
    );
  }
}

class FlutterAsyncDemo extends StatefulWidget {
  @override
  _FlutterAsyncDemoState createState() => _FlutterAsyncDemoState();
}

class _FlutterAsyncDemoState extends State<FlutterAsyncDemo> {

  String downloadTextHolder = "Loading...";

  // Displays the String object on the app
  _printFileContent() async {
    String downloadContent = await _downloadFile();

    setState(() {
      downloadTextHolder = downloadContent;
    });
  }

  // Method that returns the string after 10 seconds
  Future<String> _downloadFile() {
    Future<String> returnString = Future.delayed(Duration(seconds: 10), () {
      return 'File is downloaded!';
    });

    return returnString;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Async Demo'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text("Your download is now here"),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                    downloadTextHolder,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _printFileContent();
  }
}
