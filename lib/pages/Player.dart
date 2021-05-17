import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/widgets/PlayingSong.dart';

class Player extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 251, 251, 1),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            children: [
              //PlayingSong('Dua Lipa', 'Love Again', Image.asset('assets/cv.png')),
            ],
          ),
        ),
      ),
    );
  }
}
