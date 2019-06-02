import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _email, password = TextEditingController();
  String getEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: Container(
        alignment: Alignment(20, 20),
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 22.0),
                children: <Widget>[
                  SizedBox(
                    height: kToolbarHeight,
                  ),
                  TextField(                    // 이미엘
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(GroovinMaterialIcons.github_box),
                      labelText: '깃허브 계정',
                    ),
                    onChanged: (i) {
                      getEmail = i;
                    },
                  ),

                  // 비번
                ],
              ),
            ),
            RaisedButton(
              child: Text('확인'),
              color: Colors.blue,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Fluttertoast.showToast(msg: '이메일이 아닙니다.');
                }
                Fluttertoast.showToast(msg: '$getEmail');
              },
            )
          ],
        ),
      )
    );
  }
}