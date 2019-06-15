import 'package:flutter/material.dart';
import 'all_page/main_page.dart';
import 'Login.dart';

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
      home: MenuPage(),
    );
  }
}

