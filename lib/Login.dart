import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// @Autor Lansional
///     로그인 화면
/// 로그인 페이지 순서
/// Material -> Align -> Column -> SizedBox -> Form -> Align -> ListView

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  String getEmail, getPassWord;

  @override
  Widget build(BuildContext context) {
    return Scaffold(                                                // all
      backgroundColor: Colors.cyanAccent,
      body: Container(                                              // 화면 위치 설정
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              GroovinMaterialIcons.sigma,
              color: Colors.deepPurple,
              size: 110,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: '이메일',
                  ),
                  onChanged: (i) => getEmail = i,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: Icon(GroovinMaterialIcons.lock),
                    labelText: '비밀번호',
                  ),
                  onChanged: (i) => getPassWord = i,
                  obscureText: true,
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  backgroundColor: Colors.grey,
                  child: Icon(GroovinMaterialIcons.github_face),
                  onPressed: () => Fluttertoast.showToast(msg: 'login'),
                ),

                FloatingActionButton(
                  child: Icon(GroovinMaterialIcons.google),
                  backgroundColor: Colors.black,
                  onPressed: null,
                )
              ],
            )
          ],
        )
      ),
    );
  }
}