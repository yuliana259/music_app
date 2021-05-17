import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/myApp_translations.dart';
import 'package:music_app/pages/BaseUsers.dart';
import 'package:music_app/pages/Entrance.dart';
import 'package:music_app/pages/ErrorPlaylist.dart';
import 'package:music_app/pages/GreetUser.dart';
import 'package:music_app/pages/Player.dart';
import 'package:music_app/pages/MusicApp.dart';
import 'package:music_app/pages/ProfileAdmin.dart';
import 'package:music_app/pages/SearchPage.dart';
import 'package:music_app/pages/SongsAdmin.dart';
import 'package:music_app/pages/User.dart';
import 'package:music_app/widgets/PlayingSong.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: MyAppTranslations(),
      locale: Get.deviceLocale,
      title: 'Music App',
      theme: ThemeData(
        textTheme: GoogleFonts.comfortaaTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: MusicApp(),
    );
  }
}
