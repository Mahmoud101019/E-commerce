// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print, duplicate_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commers/routes/routes.dart';
import 'package:get/get.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool isVisibilty = false;
  bool isCheckbox = false;

  var displayUsername = '';
  var displayuserphoto = '';

  var Issignin = false;
  final GetStorage authBox = GetStorage();

  FirebaseAuth auth = FirebaseAuth.instance;
  var Googlesignin = GoogleSignIn();

//////////////////////////////////////////////////////
  void Visibilty() {
    isVisibilty = !isVisibilty;

    update();
  }

//////////////////////////////////////////////////////
  void Checkbox() {
    isCheckbox = !isCheckbox;

    update();
  }
//////////////////////////////////////////////////////

  void SignupFirbase({
    required String Name,
    required String Email,
    required String Password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: Email, password: Password)
          .then((value) => () {
                displayUsername = Name;
                auth.currentUser!.updateDisplayName(Name);
              });

      update();
      Get.offNamed(Routes.LoginScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceFirst(RegExp('-'), '  ').capitalize!;
      String message = '';

      if (error.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (error.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: Colors.black,
        duration: const Duration(seconds: 5),
      );
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: Colors.black,
        duration: const Duration(seconds: 5),
      );
    }
  }

//////////////////////////////////////////////////////

  void logInUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Issignin = true;
      authBox.write("auth", Issignin);
      update();
      Get.offNamed(Routes.MainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message =
            ' Account does not exists for that $email.. Create your account by signing up..';
      } else if (error.code == 'wrong-password') {
        message = ' Invalid Password... PLease try again! ';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
//////////////////////////////////////////////////////

  void googlesignupApp() async {
    try {
      final GoogleSignInAccount? googleUser = await Googlesignin.signIn();

      displayUsername = googleUser!.displayName!;
      displayuserphoto = googleUser.photoUrl!;
      Issignin = true;
      authBox.write("auth", Issignin);

      update();

      Get.offNamed(Routes.MainScreen);
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(255, 91, 0, 122),
        colorText: Colors.white,
      );
    }
  }

//////////////////////////////////////////////////////

  void facebooksignup() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
  }

//////////////////////////////////////////////////////

  void resetpassword(
    String emil,
  ) async {
    try {
      await auth.sendPasswordResetEmail(email: emil);

      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message =
            ' Account does not exists for that $emil.. Create your account by signing up..';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
//////////////////////////////////////////////////////

  void SignoutFromApp() async {
    try {
      await auth.signOut();
      await Googlesignin.signOut();
      // await FacebookAuth.i.logOut();
      displayUsername = '';
      displayuserphoto = '';
      Issignin = false;
      authBox.remove("auth");
      update();
      Get.offNamed(Routes.WelcomeScreen);
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(255, 28, 20, 20),
        colorText: Colors.white,
      );
    }
  }
}
