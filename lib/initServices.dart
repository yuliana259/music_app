import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

Future<void> initServices() async {
  await Firebase.initializeApp();
}