import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:music_app/pages/MainPage.dart';
import 'package:music_app/pages/SuccessfulRegistration.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  final errorMessage = "".obs;

  register(String email, String password) async {
    if(email.isBlank || password.isBlank)
      errorMessage.value = "Please, input all fields";
    isLoading.value = true;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential.user.uid);
      Get.offAll(() => SuccessfulRegistration());
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'weak-password') errorMessage.value = "Weak password";
      else if(e.code == 'email-already-in-use') errorMessage.value = "The email address is already in use by another account.";
    }
    isLoading.value = false;
  }

  login(String email, String password) async {
    if(email.isBlank || password.isBlank) {
      errorMessage.value = "Please, input all fields";
      return;
    }
    isLoading.value = true;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(() => MainPage());
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'weak-password') errorMessage.value = "Weak password";
      else if(e.code == 'email-already-in-use') errorMessage.value = "The email address is already in use by another account.";
      else errorMessage.value = e.message;
    }
    isLoading.value = false;
  }
}
