import 'package:flutter/material.dart';
import 'package:music_app/pages/MainPage.dart';
import 'package:music_app/widgets/ButtonMainPage1.dart';
import 'package:music_app/widgets/InputField.dart';
import 'package:music_app/widgets/BottomNavigation.dart';
import 'package:music_app/widgets/ButtonMainPage2.dart';
import 'package:music_app/widgets/SearchField.dart';
import 'package:music_app/widgets/Song.dart';

class SearchPage extends StatelessWidget {
  final TextStyle textStyle = TextStyle(
    color: Color.fromRGBO(11, 7, 94, 1),
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );
  final TextStyle artistStyle = TextStyle(
    color: Color.fromRGBO(99, 94, 226, 1),
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  final TextStyle nameStyle = TextStyle(
    color: Color.fromRGBO(11, 7, 94, 1),
    fontSize: 20,
    //fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 251, 251, 1),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Поиск',
                      style: textStyle,
                      textAlign: TextAlign.left, //??????????
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
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: SearchField(
                        defaultValue: 'Введи свой запрос',
                        secured: false,
                      ),
                    ),
                  ],
                ),
              ),
              Song('Dua Lipa', 'Love again',Image.asset('assets/dua.png'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                }, ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(NavigationItem.SEARCH, context),
    );
  }
}
