import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hesat_quran/ui/custom_widgets/common_appbar.dart';
import 'package:hesat_quran/ui/screens/sora_play/sora_play_screen.dart';
import 'package:provider/provider.dart';

import '../../../helpers/constants.dart';
import '../../../view_model/home_view_model.dart';
import '../../theme/sizes/sizes.dart';
import '../../theme/style/colors.dart';
import '../../theme/style/font_style.dart';

class AllSorasScreen extends StatefulWidget {
  final String redaderName;
  final String readerFolder;
  const AllSorasScreen(
      {Key? key, required this.redaderName, required this.readerFolder})
      : super(key: key);

  @override
  State<AllSorasScreen> createState() => _AllSorasScreenState();
}

class _AllSorasScreenState extends State<AllSorasScreen> {
  @override
  void initState() {
    Provider.of<HomeViewModel>(context, listen: false).fetchHome(context, "0","0");
    super.initState();
  }
  int toggel = 0;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context);
    return Scaffold(
        appBar: commonAppBar(context, widget.redaderName),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              const MediumPadding(),
              Padding(
                padding: commonPaddingHorizental(context),
                child: Row(
                  children: [
                         InkWell(
                            onTap: () {
                              provider.fetchHome(context, "0","0");
                              setState(() {
                                toggel = 0;
                              });
                            },
                            child: Text(
                              'الكل',
                              style: mediumBlackFont().copyWith(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      toggel != 0 ? Colors.grey : Colors.black),
                            ),
                          ),
                          const MediumPadding(
                            horizental: true,
                          ),
                          InkWell(
                            onTap: () {
                              provider.fetchHome(context, "1","0");
                              setState(() {
                                toggel = 1;
                              });
                            },
                            child: Text(
                              'الأكثر إستماعا',
                              style: mediumBlackFont().copyWith(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      toggel != 1 ? Colors.grey : Colors.black),
                            ),
                          ),
                  ],
                ),
              ),
              const MediumPadding(),
              Expanded(
                child: Padding(
                  padding: commonPaddingHorizental(context),
                  child: ListView.builder(
                    itemCount: provider.homeItems.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () => Get.to(
                          () => SoraPlayScreen(
                                readerName: widget.redaderName,
                                soraName: provider.homeItems[index].name,
                                readerFolder: widget.readerFolder,
                                soraId: provider.homeItems[index].id,
                                // redaderName: provider.homeItems[index].,
                                // page: provider.homeItems[index].page,
                                // soraId: provider.homeItems[index].id,
                              ),
                          transition: Transition.downToUp),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        width: width(context, 1),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.gray,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: width(context, 0.19),
                              height: height(context, 0.08),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  Constants.quranHomeScreenImage,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const MediumPadding(
                              horizental: true,
                            ),
                            SizedBox(
                              width: width(context, 0.67),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    provider.homeItems[index].name,
                                    style: mediumBlackFont()
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: height(context, 0.024),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        provider.homeItems[index].pagesNum,
                                        style: sSmallBlackFont().copyWith(
                                            color: AppColors.darkGray,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'عدد الايات ${provider.homeItems[index].ayatNum}',
                                        style: sSmallBlackFont().copyWith(
                                            color: AppColors.darkGray,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
