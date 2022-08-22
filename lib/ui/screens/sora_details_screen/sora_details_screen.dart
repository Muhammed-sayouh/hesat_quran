import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/ui/custom_widgets/common_appbar.dart';
import 'package:hesat_quran/ui/custom_widgets/custom_buttons.dart';
import 'package:hesat_quran/ui/custom_widgets/custom_images.dart';
import 'package:hesat_quran/ui/theme/sizes/sizes.dart';
import 'package:hesat_quran/ui/theme/style/colors.dart';
import 'package:hesat_quran/ui/theme/style/font_style.dart';
import 'package:hesat_quran/view_model/sora_details_view_model.dart';
import 'package:provider/provider.dart';

import '../../custom_widgets/sora_properties_widget.dart';

class SoraDetailsScreen extends StatefulWidget {
  const SoraDetailsScreen({Key? key}) : super(key: key);

  @override
  State<SoraDetailsScreen> createState() => _SoraDetailsScreenState();
}

class _SoraDetailsScreenState extends State<SoraDetailsScreen> {
  @override
  void initState() {
    Provider.of<SoraDetialsViewModel>(context, listen: false).expand = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SoraDetialsViewModel>(context);
    return Scaffold(
      appBar: commonAppBar(context, Constants.readingText),
      body: Padding(
        padding: commonPaddingHorizental(context),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: height(context, 0.23),
                ),
                SizedBox(
                 
                  height: height(context, 0.6),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              CustomNetworkImage(
                                imagePath:
                                    "https://m3rfh.b-cdn.net/wp-content/uploads/2021/05/%D9%84%D9%85%D8%A7%D8%B0%D8%A7-%D8%B3%D9%85%D9%8A%D8%AA-%D8%A7%D9%84%D9%81%D8%A7%D8%AA%D8%AD%D8%A9-scaled.jpg",
                                height: height(context, 0.4),
                                width: width(context, 0.61),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width(
                                      context,
                                      0.18,
                                    ),
                                    vertical: height(context, 0.06)),
                                child: Row(
                                  children: [
                                    CustomAssetImage(
                                      imagePath: Constants.forwardCircleIcon,
                                      width: width(context, 0.1),
                                    ),
                                    const BigPadding(
                                      horizental: true,
                                    ),
                                    const BigPadding(
                                      horizental: true,
                                    ),
                                    CustomAssetImage(
                                      imagePath: Constants.backCircleIcon,
                                      width: width(context, 0.1),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SoraPropertiesList(provider: provider)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  title: Constants.zoom,
                  widthRatio: 0.3,
                  fontSized: 12,
                  textPadding: 6,
                ),
                const BigPadding(),
                CustomButton(
                  title: Constants.save,
                  widthRatio: 0.3,
                  fontSized: 12,
                  textPadding: 6,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

