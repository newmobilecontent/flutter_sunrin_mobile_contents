import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageStatus createState() => _MenuPageStatus();
}

class _MenuPageStatus extends State<MenuPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World!'),
      ),
      body: Center(
        child: FloatingActionButton(
          child: Icon(Icons.search),
          onPressed: () => Fluttertoast.showToast(msg: 'asdfasdf')
        )
      ),
    );
  }
}