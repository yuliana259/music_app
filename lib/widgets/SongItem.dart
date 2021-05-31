import 'package:flutter/material.dart';
import 'package:music_app/models/MusicModel.dart';

enum SongItemInteractType { DELETE, FAVORITE }

class SongItem extends StatelessWidget {
  final MusicModel music;
  final SongItemInteractType songItemInteractType;

  final Function onPressed;
  final Function(MusicModel music) interactAction;

  SongItem(this.music,
      {this.songItemInteractType = SongItemInteractType.FAVORITE,
      this.interactAction,
      this.onPressed});

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

  trimName(String name) {
    int limit = 16;
    if (name.length < limit) return name;
    return name.substring(0, limit) + "...";
  }

  Widget buildFavOrDeleteButton() {
    String fileName = '';
    switch (songItemInteractType) {
      case SongItemInteractType.DELETE:
        fileName = 'assets/delete.png';
        break;
      case SongItemInteractType.FAVORITE:
        fileName = 'assets/heart.png';
        break;
    }
    return InkWell(
        onTap: interactAction == null ? {} : () => interactAction(this.music),
        child: Container(width: 50, height: 50, child: Image.asset(fileName)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: double.infinity,
        child: Container(
          child: Row(
            children: [
              Image.network(
                music.imageUrl,
                width: 60,
                height: 60,
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trimName(music.artistName),
                    style: artistStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    trimName(music.songName),
                    style: nameStyle,
                  ),
                ],
              ),
              Spacer(),
              buildFavOrDeleteButton()
            ],
          ),
        ),
      ),
    );
  }
}
