import 'package:flutter/material.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/ui/theme/sizes/sizes.dart';
import 'package:hesat_quran/ui/theme/style/colors.dart';
import 'package:hesat_quran/ui/theme/style/font_style.dart';

import '../../custom_widgets/home_appbar.dart';
import '../../custom_widgets/my_drawer.dart';
import '../../custom_widgets/top_Widget_home_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldkey,
        drawer: const MyDrawer(),
        body: SafeArea(
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
                    Text(
                      'الكل',
                      style: mediumBlackFont()
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const MediumPadding(
                      horizental: true,
                    ),
                    Text(
                      'الأكثر تصفحا',
                      style: mediumBlackFont()
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const MediumPadding(),
              Expanded(
                child: Padding(
                  padding: commonPaddingHorizental(context),
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) => Container(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'الفاتحه',
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
                                      'الصفحات رقم 1',
                                      style: sSmallBlackFont().copyWith(
                                          color: AppColors.darkGray,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'عدد الايات 7',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
