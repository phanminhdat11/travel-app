import 'package:flutter/material.dart';
import 'package:futter_travel_app/core/constants/color_constants.dart';
import 'package:futter_travel_app/core/helpers/local_storage_helper.dart';
import 'package:futter_travel_app/representation/screen/splash_screen.dart';
import 'package:futter_travel_app/routes.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorageHelper();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Travel App",
      theme: ThemeData(
          primaryColor: ColorsPalette.primaryColor,
          backgroundColor: ColorsPalette.backgroundScaffoldColor,
          scaffoldBackgroundColor: ColorsPalette.backgroundScaffoldColor),
      routes: routes,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
