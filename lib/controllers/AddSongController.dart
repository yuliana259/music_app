import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:music_app/repos/MusicRepo.dart';

class AddSongController extends GetxController {
  final TextEditingController songNameController;
  final TextEditingController artistNameController;

  final imageFileName = "".obs;
  final songFileName = "".obs;

  final loading = false.obs;
  
  final statusText = "".obs;

  PlatformFile image;
  PlatformFile song;

  AddSongController(this.songNameController, this.artistNameController);

  void selectImage() async {
    var result = await FilePicker.platform.pickFiles(type: FileType.media);

    if(result != null) {
      image = result.files.first;
      imageFileName.value = image.name;
    }
  }

  void selectSong() async {
    var result = await FilePicker.platform.pickFiles(type: FileType.audio);

    if(result != null) {
      song = result.files.first;
      songFileName.value = song.name;
    }
  }
  
  void submit() async {
    if(songNameController.text.isBlank) {
      statusText.value = "error_input_song_name".tr;
      return;
    }
    if(artistNameController.text.isBlank) {
      statusText.value = "error_input_artist_name".tr;
      return;
    }
    if(songFileName.value.isBlank) {
      statusText.value = "error_select_song".tr;
      return;
    }
    if(imageFileName.value.isBlank) {
      statusText.value = "error_select_image".tr;
      return;
    }

    loading.value = true;

    await MusicRepo.addSong(songNameController.text, artistNameController.text, image, song);

    loading.value = false;

    Get.snackbar("Status response", "Song successfully added");
    songNameController.clear();
    artistNameController.clear();
  }
}