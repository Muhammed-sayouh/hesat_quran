import 'package:flutter/material.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/ui/screens/home_screen/home_screen.dart';
import 'package:hesat_quran/ui/screens/intro_screens.dart/second_intro_screen/second_intro_screen.dart';
import 'package:hesat_quran/ui/screens/spalsh_screen/spalsh_screen.dart';
import 'package:hesat_quran/ui/theme/style/font_style.dart';

class NextBackWidget extends StatelessWidget {
  final bool firstIntro;
  const NextBackWidget({Key? key, required this.firstIntro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: firstIntro
          ? () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const SecondIntroScreen(),
                ),
              )
          : () =>Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) =>  HomeScreen(),
                ),
              ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
           firstIntro? Constants.next:Constants.start,
            style: mediumBlackFont().copyWith(fontWeight: FontWeight.bold),
          ),
        firstIntro?  SizedBox(width: 20, child: Image.asset(Constants.nextA)):const SizedBox(),
        ],
      ),
    );
  }
}
