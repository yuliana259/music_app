import 'package:flutter/material.dart';
import 'package:music_app/pages/SearchPage.dart';
import 'package:music_app/pages/Settings.dart';
 class PlayingSong extends StatelessWidget {
  final String artistName;
  final String songName;
  final Image image;

  PlayingSong(this.artistName, this.songName, this.image);

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
    return Container(
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MaterialButton(
            height: 25,
            minWidth: 20,
            child: Image.asset('assets/back.png'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
          ),
          SizedBox(height: 26,),
          Center(child: image),
          SizedBox(height: 30,),
          Center(
            child: Text(
              artistName,
              style: artistStyle,
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: Text(
              songName,
              style: nameStyle,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            // линия
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.all(Radius.circular(2)),
                   color: Colors.deepPurpleAccent),
              height: 3),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                height: 25,
                minWidth: 20,
                child: Image.asset('assets/prev.png'),
                onPressed: () => print('Privet'),
              ),
              MaterialButton(
                height: 25,
                minWidth: 20,
                child: Image.asset('assets/play.png'),
                onPressed: () => print('Privet'),
              ),
              MaterialButton(
                height: 25,
                minWidth: 20,
                child: Image.asset('assets/next.png'),
                onPressed: () => print('Privet'),
              ),
            ],
          ),
          SizedBox(height: 60,),
          Container(
            // линия
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.all(Radius.circular(2)),
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(168, 219, 250, 1),
                    Color.fromRGBO(99, 94, 226, 1),
                  ])),
              height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                height: 25,
                minWidth: 20,
                child: Image.asset('assets/low.png'),
                onPressed: () => print('Privet'),
              ),
              MaterialButton(
                height: 25,
                minWidth: 20,
                child: Image.asset('assets/sound.png'),
                onPressed: () => print('Privet'),
              ),
            ],

          ),
        ],
      ),
    );
  }
}
