import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: '모바일 콘텐츠'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//enum Login {
//  Email,
//  GOOGLE,
//  Facebook,
//  Github,
//}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Just Test'),
      ),
      body: FloatingActionButton(
        child: Icon(Icons.access_alarm),
        tooltip: 'Tooltip',
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        shape: const Border(),
        onPressed: () {
          Fluttertoast.showToast(
            msg: 'Oh Yeah!!!~~~',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1
          );
        },
      ),
    );
  }
}
