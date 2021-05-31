import 'package:firebase_storage/firebase_storage.dart';

Future<bool> deleteFileFromFirebaseByUrl(String urlFile) async {
  String fileName = urlFile.replaceAll("/o/", "*");
  fileName = fileName.replaceAll("?", "*");
  fileName = fileName.split("*")[1];
  var storageReference = FirebaseStorage.instance.ref();
  return storageReference
      .child(fileName)
      .delete()
      .then((_) => true);
}
