import 'package:flutter/material.dart';
import 'package:music_app/pages/ProfileAdmin.dart';
import 'package:music_app/widgets/SearchField.dart';
import 'package:music_app/widgets/Song.dart';
import 'package:get/get.dart';
class SongsAdmin extends StatelessWidget {
  final TextStyle headerStyle = TextStyle(
    color: Color.fromRGBO(11, 7, 94, 1),
    fontSize: 32,
    fontWeight: FontWeight.bold,
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
              SizedBox(height: 10,),
              Row(
                children: [
                  MaterialButton(
                    height: 25,
                    minWidth: 20,
                    child: Image.asset('assets/back.png'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileAdmin()),
                      );
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 19),
                        child: Text(
                          'Песни',
                          style: headerStyle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: SearchField(
                  defaultValue: 'Введи свой запрос',
                  secured: false,
                ),
              ),
              Song('dua lipa','levitating',Image.asset('assets/dua.png')),
            ],
          ),
        ),
      ),
    );
  }
}
