import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:fluttertoast/fluttertoast.dart';

import 'all_page/main_page.dart';
import 'utils/analytics.dart';

/// @Autor Lansional
///     로그인 화면
/// 로그인 페이지 순서
/// Material -> Align -> Column -> SizedBox -> Form -> Align -> ListView

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  String getEmail, getPassWord;                                     // getEmail: 사용자가 입력한 이메일 정보, getPassWord: 사용자가 입력한 비밀번호 정보

  @override
  Widget build(BuildContext context) {
    return Scaffold(                                                // all
      body: Container(                                              // 화면 위치 설정
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.cyanAccent, Colors.red]
          )
        ),
        padding: EdgeInsets.all(40.0),
//        padding: EdgeInsets.only(
//          top: 40,
//          bottom: 200,
//          left: 50,
//          right: 50
//        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    color: Colors.deepOrangeAccent,
                    elevation: 35.0,
                    child: Icon(
                      GroovinMaterialIcons.sigma,
                      color: Colors.deepPurple,
                      size: 90,
                    ),
                  ),
                ),
                Text(
                  '개발자를 위한 앱',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),

//            Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                TextField(
//                  keyboardType: TextInputType.text,
//                  decoration: InputDecoration(
//                    icon: Icon(Icons.email),
//                    labelText: '이메일',
//                  ),
//                  onChanged: (i) => getEmail = i,
//                ),
//                TextField(
//                  keyboardType: TextInputType.text,
//                  decoration: InputDecoration(
//                    icon: Icon(GroovinMaterialIcons.lock),
//                    labelText: '비밀번호',
//                  ),
//                  onChanged: (i) => getPassWord = i,
//                  obscureText: true,
//                ),
//              ],
//            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // 깃허브 와 구글 로그인 버튼
//                FloatingActionButton(
//                  backgroundColor: Colors.grey,
//                  child: Icon(GroovinMaterialIcons.github_face),
//                  onPressed: () => Fluttertoast.showToast(msg: 'github'),
//                ),
                FloatingActionButton(
                  child: Icon(GroovinMaterialIcons.google),
                  backgroundColor: Colors.black,
                  onPressed: () {
                    AuthService().googleSignIn()
                        .then((FirebaseUser user) => print(user))
                        .catchError((e) => print(e));
                    MenuPage();
                  },
                ),
//                FloatingActionButton(                             // 디버그 모드 버튼
//                    child: Icon(Icons.assignment_turned_in),
//                    onPressed: () {
//                      Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (context) => MenuPage()), (route) => route == null);
//                    }
//                )
              ],
            ),
          ],
        )
      ),
    );
  }
  bool LoginTest() {                  // 입력한 이메일과 비번이 일치한지 확인

  }
}