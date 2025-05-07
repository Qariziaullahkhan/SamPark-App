import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sampark_app/config/pagepath.dart';
import 'package:sampark_app/config/strings.dart';
import 'package:sampark_app/config/theme.dart';
import 'package:sampark_app/firebase_options.dart';
import 'package:sampark_app/pages/splash/splac_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppsStrings.appName,
        theme: lighttheme,
        darkTheme: darkthem,
        getPages: pagepath,
        themeMode: ThemeMode.dark,
        home: const SplacPage(),
      ),
    );
  }
}
