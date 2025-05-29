import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark_app/models/user_model.dart';

class ProfileController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final store = FirebaseStorage.instance;
  Rx<UserModel> currentUser = UserModel().obs;
  RxBool isloading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserdetails();
  }

  // profile data
  Future<void> getUserdetails() async {
    if (auth.currentUser == null) {
      Get.snackbar("Error", "User not logged in", backgroundColor: Colors.red);
      return;
    }

    try {
      DocumentSnapshot doc =
          await db.collection("users").doc(auth.currentUser!.uid).get();
      if (doc.exists && doc.data() != null) {
        currentUser.value =
            UserModel.fromJson(doc.data()! as Map<String, dynamic>);
      } else {
        Get.snackbar("Error", "User not found", backgroundColor: Colors.red);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }

  Future<String> uploadImage(String imageUrl) async {
    isloading.value = true;
    final path = 'file/$imageUrl';
    final file = File(imageUrl);

    try {
      final ref = store.ref().child(path).putFile(file);
      final uploadTask = await ref.whenComplete(() {});
      final downloadImageUrl = await uploadTask.ref.getDownloadURL();
      return downloadImageUrl;
    } catch (e) {
      return ''; // Return an empty string or handle it appropriately
    }
  }

  Future<void> updateprofile(
      String imageUrl, String name, String about, String number) async {
    isloading.value = true;
    try {
      final imageLink = await uploadImage(imageUrl);
      final updateduser = UserModel(
        id: auth.currentUser!.uid,
        email: auth.currentUser!.email,
        name: name,
        about: about,
        phone: number,
        profileImage: imageLink,
      );
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .set(updateduser.toJson());
      await getUserdetails();
      isloading.value = false;
      print("image link ");
    } catch (e) {
      print(e.toString());
    }
  }
}
