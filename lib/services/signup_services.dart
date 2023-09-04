import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../views/loginScreen.dart';

signUpUser(
  String userName,
  String userEmail,
  String userPassword,
) async {
  User? userid = FirebaseAuth.instance.currentUser;

  try {
    await FirebaseFirestore.instance.collection("users").doc(userid!.uid).set({
      'userName': userName,
      'userEmail': userEmail,
      'createdAt': DateTime.now(),
      'userId': userid.uid,
    }).then((value) => {
          FirebaseAuth.instance.signOut(),
          Get.to(() => const LoginScreen()),
        });
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      Fluttertoast.showToast(msg: 'The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      Fluttertoast.showToast(msg: 'The account already exists for that email.');
    }
  } catch (e) {
    Fluttertoast.showToast(msg: 'Error is: $e');
  }
}
