import 'package:flutter/material.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/ui/screens/intro_screens.dart/first_intro_screen/first_intro_screen.dart';
import 'package:hesat_quran/ui/theme/sizes/sizes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const FirstIntroScreen(),
              ),
            ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: height(context, 1),
            width: width(context, 1),
            child: Image.asset(
              Constants.splashBG,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width(context, 0.2)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: width(context, 0.6),
                    // height: height(context, 0.3),
                    child: Image.asset(
                      Constants.logoImage,
                      fit: BoxFit.fill,
                    )),
                const BigPadding(),
                SizedBox(
                    width: width(context, 0.6),
                    child: Image.asset(
                      Constants.textLogoImage,
                      fit: BoxFit.fill,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
