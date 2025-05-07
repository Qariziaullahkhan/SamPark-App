import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final auth = FirebaseAuth.instance;

  @override
  void onInit() async {
    super.onInit();
    splashHande();
  }

  Future<void> splashHande() async {
    await Future.delayed(Duration(seconds: 3));
    if (auth.currentUser == null) {
      Get.offAllNamed('/authpage');
    } else {
      Get.offAllNamed('/homepage');
    }
  }
}
