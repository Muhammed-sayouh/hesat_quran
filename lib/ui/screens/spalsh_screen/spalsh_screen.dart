import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/ui/screens/continue_reading/continue_reading_screen.dart';
import 'package:hesat_quran/ui/screens/home_screen/home_screen.dart';
import 'package:hesat_quran/ui/screens/intro_screens.dart/first_intro_screen/first_intro_screen.dart';
import 'package:hesat_quran/ui/theme/sizes/sizes.dart';

import '../../../models/my_saves_model.dart';
import '../../../services/get_my_saves.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool loader = true;
  List<MySavesModel> readers = [];
  Future<void> fetchData(BuildContext context) async {
    loader = true;
    try {
      readers = await getMySavesService();
      print(readers.length);
      setState(() {
        loader = false;
      });
    } catch (error) {
      rethrow;
    }
  }

  GetStorage storage = GetStorage();

  @override
  void initState() {
    fetchData(context).then((value) {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        if (readers.isEmpty) {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (BuildContext context) => storage.read("first") != null
                  ? HomeScreen()
                  : const FirstIntroScreen(),
            ),
          );
        } else {
          Get.to(() => const ContinueReadingScreen(
            fromSplash: true,
          ),
              transition: Transition.downToUp);
        }
      });
    });
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
