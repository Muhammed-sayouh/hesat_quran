import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/ui/custom_widgets/common_appbar.dart';
import 'package:hesat_quran/ui/custom_widgets/custom_buttons.dart';
import 'package:hesat_quran/ui/custom_widgets/custom_images.dart';
import 'package:hesat_quran/ui/theme/sizes/sizes.dart';
import 'package:hesat_quran/ui/theme/style/colors.dart';
import 'package:hesat_quran/ui/theme/style/font_style.dart';

import '../../custom_widgets/continue_reading_item.dart';

class ContinueReadingScreen extends StatelessWidget {
  const ContinueReadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, Constants.countineReading),
      body: SingleChildScrollView(
        child: Padding(
          padding: commonPaddingHorizental(context),
          child: Column(
            children: [
              SizedBox(
                height: height(context, 0.04),
              ),
              CustomAssetImage(
                imagePath: Constants.textLogoImage,
                width: width(context, 0.6),
                height: height(context, 0.1),
              ),
              SizedBox(
                height: height(context, 0.1),
              ),
              const ContinueReadingItem(title: 'الفاتحه'),
              SizedBox(
                height: height(context, 0.1),
              ),
          CustomButton(title: Constants.continueText),
             SizedBox(
                height: height(context, 0.03),
              ),
          CustomButton(title: Constants.skip),
            ],
          ),
        ),
      ),
    );
  }
}
