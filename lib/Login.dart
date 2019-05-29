import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool _isObscure = true;
  Color _eyeColor;
  List _loginMethod = [
  {
  "title": "facebook",
  "icon": GroovinMaterialIcons.facebook,
  },
  {
  "title": "google",
  "icon": GroovinMaterialIcons.google,
  },
  {
  "title": "twitter",
  "icon": GroovinMaterialIcons.twitter,
  },
  ];

@override
Widget build(BuildContext context) {
  return Scaffold(
      body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            children: <Widget>[
              SizedBox(
                height: kToolbarHeight,
              ),
              buildTitle(),
              buildTitleLine(),
              SizedBox(height: 70.0),
              buildEmailTextField(),
              SizedBox(height: 30.0),
              buildPasswordTextField(context),
              buildForgetPasswordText(context),
              SizedBox(height: 60.0),
              buildLoginButton(context),
              SizedBox(height: 30.0),
              buildOtherLoginText(),
              buildOtherMethod(context),
              buildRegisterText(context),
            ],
          )));
}

Align buildRegisterText(BuildContext context) {
  return Align(
    alignment: Alignment.center,
    child: Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('계정이 없습니까?'),
          GestureDetector(
            child: Text(
              '계정 만들기',
              style: TextStyle(color: Colors.green),
            ),
            onTap: () {
              //TODO 계정 만들기 화면에 가기
              print('계정 만들어 가기');
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
  );
}

ButtonBar buildOtherMethod(BuildContext context) {
  return ButtonBar(
    alignment: MainAxisAlignment.center,
    children: _loginMethod
        .map((item) => Builder(
      builder: (context) {
        return IconButton(
            icon: Icon(item['icon'],
                color: Theme.of(context).iconTheme.color),
            onPressed: () {
              //TODO : 다른 계정으로 로그인
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text("${item['title']}로그인"),
                action: new SnackBarAction(
                  label: "취소",
                  onPressed: () {},
                ),
              ));
            });
      },
    ))
        .toList(),
  );
}

Align buildOtherLoginText() {
  return Align(
      alignment: Alignment.center,
      child: Text(
        '다른 계정으로 로그인',
        style: TextStyle(color: Colors.grey, fontSize: 14.0),
      ));
}

Align buildLoginButton(BuildContext context) {
  return Align(
    child: SizedBox(
      height: 45.0,
      width: 270.0,
      child: RaisedButton(
        child: Text(
          'Login',
          style: Theme.of(context).primaryTextTheme.headline,
        ),
        color: Colors.black,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            /// 입력한 내용이 요구대로라면 통과하여 여기 지나간다
            _formKey.currentState.save();
            // TODO 로그인방법
            print('email:$_email , assword:$_password');
          }
        },
        shape: StadiumBorder(side: BorderSide()),
      ),
    ),
  );
}

Padding buildForgetPasswordText(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Align(
      alignment: Alignment.centerRight,
      child: FlatButton(
        child: Text(
          '비번을 잊어버렸니？',
          style: TextStyle(fontSize: 14.0, color: Colors.grey),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
  );
}

TextFormField buildPasswordTextField(BuildContext context) {
  return TextFormField(
    onSaved: (String value) => _password = value,
    obscureText: _isObscure,
    validator: (String value) {
      if (value.isEmpty) {
        return '비밀번호를 입력하여주세요';
      }
    },
    decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: IconButton(
            icon: Icon(
              Icons.remove_red_eye,
              color: _eyeColor,
            ),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
                _eyeColor = _isObscure
                    ? Colors.grey
                    : Theme.of(context).iconTheme.color;
              });
            })),
  );
}

TextFormField buildEmailTextField() {
  return TextFormField(
    decoration: InputDecoration(
      labelText: 'Emall Address',
    ),
    validator: (String value) {
      var emailReg = RegExp(
          r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
      if (!emailReg.hasMatch(value)) {
        return 'email 정규식이 맞지 않습니다.';
      }
    },
    onSaved: (String value) => _email = value,
  );
}

Padding buildTitleLine() {
  return Padding(
    padding: EdgeInsets.only(left: 12.0, top: 4.0),
    child: Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        color: Colors.black,
        width: 40.0,
        height: 2.0,
      ),
    ),
  );
}

Padding buildTitle() {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Text(
      'Login',
      style: TextStyle(fontSize: 42.0),
    ),
  );
}
}