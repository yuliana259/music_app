import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:music_app/firestorage_utls.dart';
import 'package:music_app/models/MusicModel.dart';

class MusicRepo {
  static final CollectionReference _musics =
      FirebaseFirestore.instance.collection('musics');

  static Future<List<MusicModel>> getMusics() async {
    return _musics.get().then((musics) => musics.docs
        .map((music) => MusicModel.fromJson(music.data(), music.id))
        .toList());
  }

  static void deleteMusic(MusicModel music) async {
    var musicRef = _musics.doc(music.uid);

    if (await deleteFileFromFirebaseByUrl(music.imageUrl))
      print("Image deleted");
    if (await deleteFileFromFirebaseByUrl(music.songUrl)) print("Song deleted");

    FirebaseFirestore.instance
        .runTransaction((transaction) async => transaction.delete(musicRef));
  }

  static addSong(String songName, String artistName, PlatformFile image,
      PlatformFile song) async {

    var storage = FirebaseStorage.instance;
    var currentTime = DateTime.now().millisecond.toString();
    TaskSnapshot imageTask = await storage
        .ref('uploads/${songName + currentTime}')
        .putData(image.bytes);
    TaskSnapshot songTask = await storage
        .ref('uploads/${artistName + currentTime}')
        .putData(song.bytes);
    if (imageTask.state == TaskState.success &&
        songTask.state == TaskState.success) {
      String imageUrl = await imageTask.ref.getDownloadURL();
      String songUrl = await songTask.ref.getDownloadURL();

      MusicModel newMusic = MusicModel(
          songUrl: songUrl,
          imageUrl: imageUrl,
          songName: songName,
          artistName: artistName);

      await _musics.add(newMusic.toJson());
    }
  }
}
