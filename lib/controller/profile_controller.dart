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

  Future<void> uploadImage(
    String? imageUrl,
  ) async {
    isloading.value = true;
    final path = 'file/${imageUrl}';
    final file = File(imageUrl!);
    if (imageUrl != null) {
      try {
        final ref = store.ref().child(path).putFile(file);
        final uploadTask = await ref.whenComplete(() {});
        final downloadimageurl = await uploadTask.ref.getDownloadURL();
        print(downloadimageurl);
      } catch (e) {
        print(e);
      }
    }
  }
}
