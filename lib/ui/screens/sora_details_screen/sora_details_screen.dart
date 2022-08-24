import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/ui/custom_widgets/common_appbar.dart';
import 'package:hesat_quran/ui/custom_widgets/custom_buttons.dart';
import 'package:hesat_quran/ui/custom_widgets/custom_images.dart';
import 'package:hesat_quran/ui/screens/sora_zoom_Screen/sora_zoom_Screen.dart';
import 'package:hesat_quran/ui/theme/sizes/sizes.dart';
import 'package:hesat_quran/view_model/sora_details_view_model.dart';
import 'package:provider/provider.dart';

import '../../custom_widgets/sora_properties_widget.dart';

class SoraDetailsScreen extends StatefulWidget {
  final String page;
  final String soraId;
  const SoraDetailsScreen({Key? key, required this.page, required this.soraId}) : super(key: key);

  @override
  State<SoraDetailsScreen> createState() => _SoraDetailsScreenState();
}

class _SoraDetailsScreenState extends State<SoraDetailsScreen> {
  @override
  void initState() {
    Provider.of<SoraDetialsViewModel>(context, listen: false).expand = false;
    Provider.of<SoraDetialsViewModel>(context, listen: false)
        .fetchCategories(context);
    Provider.of<SoraDetialsViewModel>(context, listen: false)
        .imageLink(page: widget.page);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.soraId);
    print(widget.page);
    final provider = Provider.of<SoraDetialsViewModel>(context);
    return Scaffold(
      appBar: commonAppBar(context, Constants.readingText),
      body: provider.categoriesLoader
          ? const Center(child: CupertinoActivityIndicator())
          : Padding(
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
                                      imagePath: provider.imageUrl!,
                                      height: height(context, 0.4),
                                      width: width(context, 0.63),
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
                                          InkWell(
                                            onTap: () => provider.previousPage(),
                                            child: CustomAssetImage(
                                              imagePath:
                                                  Constants.forwardCircleIcon,
                                              width: width(context, 0.1),
                                            ),
                                          ),
                                          const BigPadding(
                                            horizental: true,
                                          ),
                                          const BigPadding(
                                            horizental: true,
                                          ),
                                          InkWell(
                                              onTap: () => provider.nextPage(),
                                            child: CustomAssetImage(
                                              imagePath: Constants.backCircleIcon,
                                              width: width(context, 0.1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SoraPropertiesList(provider: provider , soraId: widget.soraId,)
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
                        onTap: () => Get.to(()=>const SoraZoomScreen(),transition: Transition.zoom),
                        title: Constants.zoom,
                        widthRatio: 0.3,
                        fontSized: 12,
                        textPadding: 6,
                      ),
                      const BigPadding(),
                      CustomButton(
                        onTap: () => provider.saveSora(context, widget.soraId),
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
