import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/modals/user_modal.dart';
import 'dart:developer';

class LoginHelper {

  LoginHelper._();

  static final login_helper = LoginHelper._();

  GoogleSignIn google = GoogleSignIn();
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  sign_in_anonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      log("Sign in Anonymusly.");
      return true;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("this is not available for this project.");
          break;
        default:
          print("Unkown Error");
      }
      return false;
    }
  }

  sign_out() async {
    await FirebaseAuth.instance.signOut();
    log("Sign out.");
    google.signOut();
    return true;
  }

  sign_in_with_password_username(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      firebaseFirestore.collection('users').doc(userCredential.user!.uid).set({
        'uid':userCredential.user!.uid,
        'email':email,
      },SetOptions(merge: true));
      return true;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "weak-password":
          log(e.code);
          break;
        case "email_already-in-use":
          log(e.code);
          break;
        default:
          log(e.code);
      }
    }
  }
  sign_up_with_password_username(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      firebaseFirestore.collection('users').doc(userCredential.user!.uid).set({
        'uid':userCredential.user!.uid,
        'email':email,
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "weak-password":
          log(e.code);
          break;
        case "email_already-in-use":
          log(e.code);
          break;
        default:
          log(e.code);
      }
    }
  }

  Future<UserModal> signin_with_google() async {
    GoogleSignInAccount? account = await google.signIn();
    GoogleSignInAuthentication authentication = await account!.authentication;

    UserModal user_modal = UserModal(
        id: account.id, image: account.photoUrl ?? "", Email: account.email);

    AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: authentication.idToken,
      accessToken: authentication.accessToken,
    );

    FirebaseAuth.instance.signInWithCredential(authCredential);

    log("ACCOUNT EMAIL:-${account.email}");

    return user_modal;
  }

}