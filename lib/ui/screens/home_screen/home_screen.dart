import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/services/get_my_search.dart';
import 'package:hesat_quran/ui/screens/sora_details_screen/sora_details_screen.dart';
import 'package:hesat_quran/ui/theme/sizes/sizes.dart';
import 'package:hesat_quran/ui/theme/style/colors.dart';
import 'package:hesat_quran/ui/theme/style/font_style.dart';
import 'package:hesat_quran/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../../models/search_model.dart';
import '../../custom_widgets/home_appbar.dart';
import '../../custom_widgets/my_drawer.dart';
import '../../custom_widgets/top_Widget_home_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
 

  @override
  void initState() {
    Provider.of<HomeViewModel>(context, listen: false)
        .fetchHome(context, "0", "0");
    Provider.of<HomeViewModel>(context, listen: false).addUserToken();
    super.initState();
  }

  int toggel = 0;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeViewModel>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldkey,
        drawer: const MyDrawer(),
        body: provider.Loader
            ? const Center(child: CupertinoActivityIndicator())
            : SafeArea(
                child: Column(
                  children: [
                    HomeAppBar(
                      scaffoldkey: _scaffoldkey,
                    ),
                    Padding(
                      padding: commonPaddingHorizental(context),
                      child: const TopWidgetHomeScreen(),
                    ),
                    const MediumPadding(),
                    Padding(
                      padding: commonPaddingHorizental(context),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              provider.fetchHome(context, "0", "0");
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
                              provider.fetchHome(context, "2", "0");
                              setState(() {
                                toggel = 1;
                              });
                            },
                            child: Text(
                              'الأكثر تصفحا',
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
                                () => SoraDetailsScreen(
                                      page: provider.homeItems[index].page,
                                      soraId: provider.homeItems[index].id,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          provider.homeItems[index].name,
                                          style: mediumBlackFont().copyWith(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: height(context, 0.024),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              provider
                                                  .homeItems[index].pagesNum,
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
              ),
      ),
    );
  }
}
