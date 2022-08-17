import 'package:flutter/material.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/ui/custom_widgets/next_back_widget.dart';
import 'package:hesat_quran/ui/custom_widgets/tow_dots_widget.dart';
import 'package:hesat_quran/ui/theme/sizes/sizes.dart';
import 'package:hesat_quran/ui/theme/style/font_style.dart';

class SecondIntroScreen extends StatelessWidget {
  const SecondIntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: commonPaddingHorizental(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height(context, 0.1),),
            SizedBox(
              width: width(context, 0.65),
           
              child: Image.asset(Constants.slider2TextLogo),
            ),
            const MediumPadding(),
            SizedBox(
              width: width(context, 0.6),
              height: height(context, 0.08),
              child: Image.asset(
                Constants.sliderTextLogo,
              ),
            ),
            const MediumPadding(),
            SizedBox(
                width: width(context, 0.9),
                child: Text(
                  Constants.firstIntroScreenText,
                  textAlign: TextAlign.center,
                  style: mediumBlackFont()
                      .copyWith(height: 1.2, fontWeight: FontWeight.bold),
                )),
                      const MediumPadding(),
            const MediumPadding(),
            const MediumPadding(),

                const NextBackWidget(firstIntro: false,),
            SizedBox(
              height: height(context, 0.06),
            ),
            const TowDotsWidget(first: false),
          ],
        ),
      ),
    ));
  }
}
