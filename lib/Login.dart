import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String getEmail, getPassWord;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 350,
            height: 100,

            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      icon: Icon(GroovinMaterialIcons.github_box),
                      labelText: '깃허브 이메일',
                    ),
                    onChanged: (i) => getEmail = i,
                  )
                ],
              ),
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
              }
          )
        ],
      ),
    );
  }
}