import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/pages/ErrorPlaylist.dart';
import 'package:music_app/pages/TopSongs.dart';
import 'package:music_app/widgets/ButtonMainPage1.dart';
import 'package:music_app/widgets/BottomNavigation.dart';

class MainPage extends StatelessWidget {
  final TextStyle textStyle = TextStyle(
    color: Color.fromRGBO(11, 7, 94, 1),
    fontSize: 36,
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
              Container(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'title_main'.tr,
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
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    //margin: EdgeInsets.only(top: 1),
                    child: ButtonMainPage1(
                      SizeButton.BIG,
                      'button1_main'.tr,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TopSongs()),
                        );
                      },
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Container(
                        //margin: EdgeInsets.only(top: 10),
                        child: ButtonMainPage1(
                          SizeButton.SMALL,
                          'button2_main'.tr,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ErrorPlaylist()),
                            );
                          },
                          color: Colors.green,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: ButtonMainPage1(
                            SizeButton.SMALL, 'button3_main'.tr,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ErrorPlaylist()),
                              );
                            },
                            color: Colors.amberAccent),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        //margin: EdgeInsets.only(top: 10),
                        child: ButtonMainPage1(
                          SizeButton.SMALL,
                          'button2_main'.tr,
                          onPressed: () => ErrorPlaylist(),
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: ButtonMainPage1(
                            SizeButton.SMALL, 'button3_main'.tr,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ErrorPlaylist()),
                              );
                            },
                            color: Colors.lightGreenAccent),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    //margin: EdgeInsets.only(top: 1),
                    child: ButtonMainPage1(
                      SizeButton.BIG,
                      'button1_main'.tr,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ErrorPlaylist()),
                        );
                      },
                      color: Colors.cyanAccent,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(NavigationItem.MAIN, context),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarT
      //   ],
      // ),
    );
  }
}
