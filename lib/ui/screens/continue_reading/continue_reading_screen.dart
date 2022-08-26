import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/models/my_saves_model.dart';
import 'package:hesat_quran/services/get_my_saves.dart';
import 'package:hesat_quran/ui/custom_widgets/common_appbar.dart';
import 'package:hesat_quran/ui/custom_widgets/custom_buttons.dart';
import 'package:hesat_quran/ui/custom_widgets/custom_images.dart';
import 'package:hesat_quran/ui/screens/home_screen/home_screen.dart';
import 'package:hesat_quran/ui/screens/sora_details_screen/sora_details_screen.dart';
import 'package:hesat_quran/ui/theme/sizes/sizes.dart';

import '../../custom_widgets/continue_reading_item.dart';
import '../../theme/style/font_style.dart';

class ContinueReadingScreen extends StatefulWidget {
  final bool fromSplash;
  const ContinueReadingScreen({Key? key, required this.fromSplash})
      : super(key: key);

  @override
  State<ContinueReadingScreen> createState() => _ContinueReadingScreenState();
}

class _ContinueReadingScreenState extends State<ContinueReadingScreen> {
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

  @override
  void initState() {
    fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool? result = await Get.offAll(HomeScreen());
        result ??= false;
        return result;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: InkWell(
              onTap: () =>
                  Get.offAll(HomeScreen(), transition: Transition.zoom),
              child: const Icon(
                CupertinoIcons.chevron_back,
                color: Colors.black,
                size: 40,
              )),
          title: Text(
            "استكمال القراءه",
            style: mediumBlackFont()
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: commonPaddingHorizental(context),
          child: loader
              ? const Center(child: CupertinoActivityIndicator())
              : Column(
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
                    readers.isEmpty
                        ? Column(
                            children: [
                              const ContinueReadingItem(
                                  title: 'لا يوجد اي سور محفوظه'),
                              SizedBox(
                                height: height(context, 0.05),
                              ),
                              CustomButton(
                                  onTap: () => Get.back(),
                                  title: Constants.continueText),
                            ],
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: readers.length,
                              itemBuilder: (context, index) => Column(
                                children: [
                                  ContinueReadingItem(
                                      title: readers[index].souraName),
                                  SizedBox(
                                    height: height(context, 0.05),
                                  ),
                                  CustomButton(
                                      onTap: () => Get.to(
                                          () => SoraDetailsScreen(
                                              page: readers[index].page,
                                              soraId: readers[index].souraId),
                                          transition: Transition.downToUp),
                                      title: Constants.continueText),
                                      const BigPadding(),
                                  widget.fromSplash
                                      ? CustomButton(
                                          onTap: () => Get.offAll(HomeScreen(),
                                              transition: Transition.zoom),
                                          title: Constants.skip)
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          ),
                    SizedBox(
                      height: height(context, 0.03),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
