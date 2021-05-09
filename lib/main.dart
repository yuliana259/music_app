import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/pages/BaseUsers.dart';
import 'package:music_app/pages/GreetUser.dart';
import 'package:music_app/pages/Player.dart';
import 'package:music_app/pages/SearchPage.dart';
import 'package:music_app/widgets/PlayingSong.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      theme: ThemeData(
        textTheme: GoogleFonts.comfortaaTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: BaseUsers(),
    );
  }
}
