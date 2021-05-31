import 'package:flutter/material.dart';
import 'package:music_app/controllers/MusicsController.dart';
import 'package:music_app/models/MusicModel.dart';
import 'package:music_app/pages/AddSong.dart';
import 'package:music_app/pages/ProfileAdmin.dart';
import 'package:music_app/widgets/SearchField.dart';
import 'package:music_app/widgets/SongItem.dart';
import 'package:get/get.dart';

import 'MusicApp.dart';

class SongsAdmin extends StatelessWidget {
  final searchController = TextEditingController();

  final TextStyle headerStyle = TextStyle(
    color: Color.fromRGBO(11, 7, 94, 1),
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    final musicsController =
        Get.put(MusicsController(filterController: searchController));

    final TextStyle textStyle = TextStyle(
      color: Color.fromRGBO(11, 7, 94, 1),
      fontSize: 36,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(99, 94, 226, 1),
        child: Icon(Icons.add),
        onPressed: () => Get.to(() => AddSong()),
      ),
      backgroundColor: Color.fromRGBO(251, 251, 251, 1),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 19),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'admin_songs'.tr,
                        style: textStyle,
                        textAlign: TextAlign.left,
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
                          defaultValue: 'field_search'.tr,
                          controller: searchController,
                          secured: false,
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () {
                    List<MusicModel> musics = musicsController.musics;
                    if (musicsController.loading.value) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (musics.length > 0) {
                      return ListView.builder(
                        itemCount: musics.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          MusicModel music = musics[index];
                          return Container(
                            padding: EdgeInsets.only(bottom: 8),
                            child: SongItem(
                              music,
                              songItemInteractType: SongItemInteractType.DELETE,
                              interactAction: (music) =>
                                  musicsController.deleteMusic(music),
                              onPressed: () {
                                Get.to(() => MusicApp(
                                      music: music,
                                    ));
                              },
                            ),
                          );
                        },
                      );
                    }
                    return Center(child: Text("Not Found"));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
