import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hesat_quran/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../helpers/constants.dart';
import '../theme/sizes/sizes.dart';
import '../theme/style/colors.dart';
import '../theme/style/font_style.dart';

class HomeAppBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldkey;
  const HomeAppBar({
    Key? key,
    required this.scaffoldkey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 2.5,
        ),
        Container(
          width: width(context, 1),
          height: height(context, 0.06),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: SizedBox(
                      width: 35,
                      child: Image.asset(
                        Constants.menuImage,
                        fit: BoxFit.fill,
                      )),
                ),
                Text(
                  Constants.main,
                  style:
                      mediumBlackFont().copyWith(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 50,
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.orange, width: 2),
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  '!',
                                  style: titleStyle().copyWith(
                                      color: Colors.orange,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ))),
                            Center(
                                child:
                                    const Text("هل تريد الخروج من التطبيق ؟")),
                            const MediumPadding(),
                            const MediumPadding(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () => Get.back(),
                                  child: Container(
                                    width: width(context, 0.18),
                                    height: height(context, 0.05),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'لا',
                                        textAlign: TextAlign.center,
                                        style: mediumBlackFont()
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                MediumPadding(horizental: true,),
                                InkWell(
                                  onTap: () => exit(0),
                                  child: Container(
                                    width: width(context, 0.18),
                                    height: height(context, 0.05),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'نعم',
                                        textAlign: TextAlign.center,
                                        style: mediumBlackFont()
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                      width: 30,
                      child: Image.asset(
                        Constants.logoutImage,
                        fit: BoxFit.fill,
                      )),
                ),
              ],
            ),
          ),
        ),
        Divider(
          thickness: 3,
          color: AppColors.gray,
        ),
      ],
    );
  }
}
