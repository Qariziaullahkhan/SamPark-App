import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  RxBool isloading = false.obs;

// lgin form
  Future<void> login(String email, String password) async {
    isloading.value = true;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      print("success");
      Get.offAllNamed('/homepage');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print(e);
      }
      isloading.value = false;
    }
  }

  // signup form
  Future<void> createUser(String email, String password) async {
    isloading.value = true;
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      isloading.value = false;
    }
  }

  // logout
  Future<void> logoutuser() async {
    await auth.signOut();
    Get.offAllNamed('/authpage');
  }
}
