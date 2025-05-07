import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:sampark_app/pages/auth/auth_page.dart';
import 'package:sampark_app/pages/chat/caht_page.dart';
import 'package:sampark_app/pages/home/home.dart';

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
      name: "/chatpage",
      page: () => ChatPage(),
      transition: Transition.rightToLeft),
];
