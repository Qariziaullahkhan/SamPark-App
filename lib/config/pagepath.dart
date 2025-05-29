import 'package:get/get.dart';
import 'package:sampark_app/models/user_model.dart';
import 'package:sampark_app/pages/auth/auth_page.dart';
import 'package:sampark_app/pages/chat/caht_page.dart';
import 'package:sampark_app/pages/contactpage/contact_page.dart';
import 'package:sampark_app/pages/home/home.dart';
import 'package:sampark_app/pages/userprofile/user_profile.dart';
import 'package:sampark_app/pages/userprofile/update_profile.dart';

var pagepath = [
  GetPage(
    name: "/authpage",
    page: () => AuthPage(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
      name: "/homepage",
      page: () => HomePage(),
      transition: Transition.rightToLeft),
  GetPage(
      name: "/userprofilepage",
      page: () => UserProfile(),
      transition: Transition.rightToLeft),
  GetPage(
      name: "/userupdateprofile",
      page: () => UserUpdateProfile(),
      transition: Transition.rightToLeft),
  GetPage(
      name: "/contactpage",
      page: () => ContactPage(),
      transition: Transition.rightToLeft),
  GetPage(
    name: "/chatpage",
    page: () {
      final UserModel user =
          Get.arguments ?? UserModel(id: "default_id", name: "Unknown User");
      return ChatPage(usermodel: user);
    },
    transition: Transition.leftToRight,
  )
];
