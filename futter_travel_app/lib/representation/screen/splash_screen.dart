import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:futter_travel_app/core/helpers/asset_helper.dart';
import 'package:futter_travel_app/core/helpers/image_helper.dart';
import 'package:futter_travel_app/core/helpers/local_storage_helper.dart';
import 'package:futter_travel_app/representation/screen/intro_screen.dart';
import 'package:futter_travel_app/representation/screen/main_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routeName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    redirectIntroScreen();
  }

  void redirectIntroScreen() async {
    final ignoreIntroScreen =
        LocalStorageHelper.getValue('ignoreIntroScreen') as bool?;
    await Future.delayed(Duration(seconds: 2));
    if (ignoreIntroScreen != null && ignoreIntroScreen) {
      Navigator.of(context).pushNamed(MainApp.routeName);
    } else {
      LocalStorageHelper.setValue('ignoreIntroScreen', true);
      Navigator.of(context).pushNamed(IntroScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Positioned(
        child: ImageHelper.loadFromAsset(AssetHelper.imageBackGroundSplash_2,
            fit: BoxFit.fitWidth),
      ),
    );
  }
}
