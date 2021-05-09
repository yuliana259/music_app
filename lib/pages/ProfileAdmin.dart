import 'package:flutter/material.dart';
import 'package:music_app/pages/AboutAdministrator.dart';
import 'package:music_app/pages/BaseUsers.dart';
import 'package:music_app/pages/Entrance.dart';
import 'package:music_app/pages/GreetUser.dart';
import 'package:music_app/pages/SearchPage.dart';
import 'package:music_app/pages/Settings.dart';
import 'package:music_app/pages/SongsAdmin.dart';
import 'package:music_app/widgets/GradientButton.dart';
import 'package:music_app/pages/SuccessfulRegistration.dart';
import 'package:music_app/widgets/HoleButton.dart';
import 'package:music_app/widgets/BottomNavigation.dart';
import 'package:music_app/pages/Info.dart';

class ProfileAdmin extends StatelessWidget {
  final TextStyle loginStyle = TextStyle(
    color: Color.fromRGBO(99, 94, 226, 1),
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  final TextStyle headerStyle = TextStyle(
    color: Color.fromRGBO(11, 7, 94, 1),
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  final TextStyle textStyle = TextStyle(
    color: Color.fromRGBO(11, 7, 94, 1),
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 251, 251, 1),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 23,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Профиль',
                    style: headerStyle,
                  ),
                ],
              ),

              SizedBox(
                height: 17,
              ),
              Container(
                  // линия
                  decoration: BoxDecoration(
                      //borderRadius: BorderRadius.all(Radius.circular(2)),
                      gradient: LinearGradient(colors: [
                    Color.fromRGBO(99, 94, 226, 1),
                    Color.fromRGBO(168, 219, 250, 1),
                  ])),
                  height: 2),
              SizedBox(
                height: 59,
              ),
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.center, // почему не ставится посередине
                children: [
                  Image.asset('assets/profile.png'),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'voronova_yuliana',
                    style: loginStyle,
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 32),
                  child: HoleButton(
                    'Выйти',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GreetGuest()),
                      );
                    },
                  )),
              SizedBox(height:45 ,),
              Row(
                children: [
                  Text(
                    'Добавить песню',
                    style: textStyle,
                  ),
                  Spacer(),
                  MaterialButton(
                    height: 25,
                    minWidth: 20,
                    child: Image.asset('assets/to.png'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Info()),
                      );
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Пользователи',
                    style: textStyle,
                  ),
                  Spacer(),
                  MaterialButton(
                    height: 25,
                    minWidth: 20,
                    child: Image.asset('assets/to.png'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BaseUsers()),
                      );
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Песни',
                    style: textStyle,
                  ),
                  Spacer(),
                  MaterialButton(
                    height: 25,
                    minWidth: 20,
                    child: Image.asset('assets/to.png'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SongsAdmin()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
