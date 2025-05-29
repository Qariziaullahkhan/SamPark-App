import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark_app/models/user_model.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  RxBool isloading = false.obs;

// lgin form
  Future<void> login(String email, String password) async {
    isloading.value = true;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Success", "Login Success",
          backgroundColor: Colors.green, colorText: Colors.white);
      Get.offAllNamed('/homepage');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Wrong Password", "Failed",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
      isloading.value = false;
    }
  }

  // signup form
  Future<void> createUser(String email, String password, String name) async {
    isloading.value = true;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // Use userCredential.user.uid instead of auth.currentUser
      await adduser(email, name, userCredential.user!.uid);
      Get.snackbar("Success", "User Created",
          backgroundColor: Colors.green, colorText: Colors.white);
      Get.offAllNamed('/homepage');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Weak Password", "Failed",
            backgroundColor: Colors.red, colorText: Colors.white);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Email already in use", "Failed",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
      isloading.value = false;
    }
  }

  // logout
  Future<void> logoutuser() async {
    await auth.signOut();
    Get.snackbar("Success", "Logout Success",
        backgroundColor: Colors.green, colorText: Colors.white);
    Get.offAllNamed('/authpage');
  }

  /// user
  Future<void> adduser(String email, String name, String uid) async {
    var newuser = UserModel(
        id: uid,
        name: name,
        email: email,
        profileImage: '', // Add default empty string
        phone: '', // Add default empty string
        about: '', // Add default empty string
        createdAt: DateTime.now().toString(), // Add current timestamp
        status: 'offline' // Add default status
        );

    try {
      await db.collection("users").doc(uid).set(newuser.toJson());
    } catch (ex) {
      Get.snackbar("Error", ex.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
