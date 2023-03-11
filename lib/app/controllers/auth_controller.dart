import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  String codeVerify = "";
  Stream<User?> streamAuthStatus() => auth.authStateChanges();
  login(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
            title: "Error!", middleText: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
            title: "Error!",
            middleText: 'Wrong password provided for that user.');
      }
    }
  }

  logout() async {
    Get.defaultDialog(
        title: "Really Want To Go?",
        middleText: 'are youe sure want to logout?',
        confirm: ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Get.offAllNamed(Routes.LOGIN);
            },
            child: Text('Yes')),
        cancel: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Get.back(),
            child: Text('No')));
  }

  register(String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      credential.user?.sendEmailVerification();
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.defaultDialog(
          title: "Error!",
          middleText: 'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        Get.defaultDialog(
            title: "Error!",
            middleText: 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    Get.toNamed(Routes.HOME);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  verifyPhone(String number)async {
    await auth.verifyPhoneNumber(
      phoneNumber: "+62${number}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then(
          (value) {
            if (value.user != null) {
              Get.toNamed(Routes.HOME);
            }
          },
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.defaultDialog(
          title: "Error!",
          middleText: 'Phone number not exist',
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        codeVerify = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        codeVerify = verificationId;
      },
      timeout: Duration(seconds: 60)
    );
    Get.offAllNamed(Routes.OTP, parameters: {"phone": number});
  }

  checkOTP(String sms)async{
    try {
      await auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: codeVerify, smsCode: sms)).then((value) {
        if(value.user != null){
          Get.toNamed(Routes.HOME);
        }
      });
    } catch (e) {
      Get.defaultDialog(
          title: "Error!",
          middleText: 'Verification Code not exist',
        );
    }
  }
}
