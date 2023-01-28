import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeze_new/models/color.dart';
import 'package:freeze_new/models/font.dart';
import 'package:freeze_new/models/img.dart';
import 'package:freeze_new/screens/app.dart';
import 'package:freeze_new/screens/question/what.dart';
import 'package:freeze_new/utilities/utility.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? email = '';
  String password = '';
  String emailErrorMsg = '';
  // TODO Image Change
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 150,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            child:
                Text('환영합니다.', style: FontKoMgr.H4, textAlign: TextAlign.left),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'E-mail',
                  labelStyle: FontEnMgr.Overline,
                  errorText: this.emailErrorMsg),
              // validator: (value) {
              //   if (!value.contains('admin@freeze.com')) {
              //     return this.emailErrorMsg = 'Enter valid E-mail';
              //   }
              //   return null;
              // },
              onSaved: (email) {
                this.email = email;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  labelStyle: FontEnMgr.Overline),
              // validator: (value) {
              //   if (value.length < 5 || !value.contains('@')) {
              //     return AppString.error_email;
              //   }
              //   return null;
              // },
              // onSaved: (email) {
              //   userDetails.email = email;
              // },
            ),
          ),
          TextButton(
            onPressed: () {
              //TODO FORGOT PASSWORD SCREEN GOES HERE
            },
            child: Text(
              'Forgot your password?',
              style: TextStyle(
                  fontFamily: "Montserrat_Medium",
                  fontSize: 10,
                  color: fromHex(GrayScale.Black),
                  decoration: TextDecoration.underline,
                  decorationThickness: 2),
            ),
          ),
          Container(
            height: 20,
          ),
          Container(
            height: 40,
            width: 400,
            decoration: BoxDecoration(
                color: fromHex(Signiture.PrimaryNormal),
                borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    // context, MaterialPageRoute(builder: (_) => App())); TODO
                    context,
                    MaterialPageRoute(builder: (_) => What()));
              },
              child: Text(
                '로그인',
                style: TextStyle(
                  fontFamily: "NotoSans_Bold",
                  fontSize: 14,
                  color: fromHex(GrayScale.White),
                ),
              ),
            ),
          ),
          Container(
            height: 10,
          ),
          Container(
            height: 40,
            width: 400,
            decoration: BoxDecoration(
              color: fromHex(GrayScale.White),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 1,
                color: fromHex(Signiture.PrimaryNormal),
              ),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => App()));
              },
              child: Text(
                '회원가입',
                style: TextStyle(
                  fontFamily: "NotoSans_Bold",
                  fontSize: 14,
                  color: fromHex(Signiture.PrimaryNormal),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 100),
            alignment: Alignment.center,
            child: Text('Sign in with', style: FontEnMgr.Caption),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20, right: 20),
                child: SvgPicture.asset(
                  ImgLocale.LogInTiktok,
                  height: 48,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, right: 20),
                child: SvgPicture.asset(
                  ImgLocale.LogInFaceBook,
                  height: 48,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: SvgPicture.asset(
                  ImgLocale.LogInKakao,
                  height: 48,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
