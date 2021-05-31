import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/controllers/AddSongController.dart';
import 'package:music_app/widgets/GradientButton.dart';
import 'package:music_app/widgets/InputField.dart';

class AddSong extends StatelessWidget {
  final TextEditingController _songNameController = TextEditingController();
  final TextEditingController _artistNameController = TextEditingController();

  final TextStyle titleStyle = TextStyle(
    color: Color.fromRGBO(11, 7, 94, 1),
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );
  final TextStyle labelStyle = TextStyle(
    color: Color.fromRGBO(11, 7, 94, 1),
    fontSize: 24,
  );

  void selectSong() async {
    var result = await FilePicker.platform.pickFiles(type: FileType.audio);
    print(result.files.first.name);
  }

  Future<FilePickerResult> selectImage() async {
    return FilePicker.platform.pickFiles(type: FileType.media);
  }

  @override
  Widget build(BuildContext context) {
    final _addSongController =
        Get.put(AddSongController(_songNameController, _artistNameController));

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text("add_new_song_title".tr, style: titleStyle)),
              Container(
                height: 2,
                decoration: BoxDecoration(
                    //borderRadius: BorderRadius.all(Radius.circular(2)),
                    gradient: LinearGradient(colors: [
                  Color.fromRGBO(99, 94, 226, 1),
                  Color.fromRGBO(168, 219, 250, 1),
                ])),
              ),
              Container(
                margin: EdgeInsets.only(top: 12, bottom: 4),
                child: Text(
                  'song_name'.tr,
                  style: labelStyle,
                ),
              ),
              InputField(controller: _songNameController,),
              Container(
                margin: EdgeInsets.only(top: 12, bottom: 4),
                child: Text(
                  'artist_name'.tr,
                  style: labelStyle,
                ),
              ),
              InputField(controller: _artistNameController,),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                      child: MaterialButton(
                    color: Colors.blue,
                    child: Text("get_image".tr),
                    onPressed: _addSongController.selectImage,
                  )),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: MaterialButton(
                        color: Colors.blue,
                        child: Text("get_song".tr),
                        onPressed: _addSongController.selectSong),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child:
                        Obx(() => Text(_addSongController.imageFileName.value)),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child:
                        Obx(() => Text(_addSongController.songFileName.value)),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 16, bottom: 6),
                  child: Obx(() => Text(_addSongController.statusText.value,
                      style: TextStyle(fontSize: 16, color: Colors.red)))),
              GradientButton(
                "add_song_button".tr,
                onPressed: _addSongController.submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
