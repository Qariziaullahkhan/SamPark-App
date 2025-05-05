import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:sampark_app/pages/auth/auth_page.dart';

var pagepath = [
  GetPage(
    name: "/authpage",
    page: () => AuthPage(),
    transition: Transition.leftToRight,
  ),
];
