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
    return Scaffold(                                        // bottom을 확인 버튼
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  icon: Icon(GroovinMaterialIcons.github_face),
                  labelText: '깃허브 이메일',
                ),
                onChanged: (i) => getEmail = i
            ),
            TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  icon: Icon(GroovinMaterialIcons.lock),
                  labelText: '깃허브 비번',
                ),
                onChanged: (i) => getPassWord = i,
              obscureText: true,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(GroovinMaterialIcons.github_face),
        onPressed: () {
          Fluttertoast.showToast(msg: '$getEmail: $getPassWord');
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10.0,
        color: Colors.blue,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.menu), onPressed: () => AlertDialog(
              title: Text('Menu'),
              content: Text('Study'),
              actions: <Widget>[
                Row(
                  children: <Widget>[
                    ButtonBar(

                    )
                  ],
                )
              ],
            )),
            IconButton(icon: Icon(Icons.search), onPressed: () => Fluttertoast.showToast(msg: 'search'))
          ],
        ),
      ),
    );
  }
}