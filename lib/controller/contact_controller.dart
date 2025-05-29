import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sampark_app/models/user_model.dart';

class ContactController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxBool isloading = false.obs;
  RxList<UserModel> userList = <UserModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    isloading.value = true;
    await getUserList();
  }

  Future<void> getUserList() async {
    isloading.value = true;
    try {
      userList.clear();
      await db.collection("users").get().then((value) {
        userList.value =
            value.docs.map((e) => UserModel.fromJson(e.data())).toList();
      });
    } catch (e) {
      print(e.toString());
    }
    isloading.value = false;
  }
}
