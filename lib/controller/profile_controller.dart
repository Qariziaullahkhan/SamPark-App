import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark_app/models/user_model.dart';

class ProfileController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  Rx<UserModel> currentUser = UserModel().obs;

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
}
