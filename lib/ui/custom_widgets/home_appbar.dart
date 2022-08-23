import 'package:flutter/material.dart';
import 'package:hesat_quran/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../helpers/constants.dart';
import '../theme/sizes/sizes.dart';
import '../theme/style/colors.dart';
import '../theme/style/font_style.dart';

class HomeAppBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldkey;
  const HomeAppBar({
    Key? key, required this.scaffoldkey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     const SizedBox(height: 2.5,),
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
                  onTap: () =>   Scaffold.of(context).openDrawer(),
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
                SizedBox(
                    width: 30,
                    child: Image.asset(
                      Constants.logoutImage,
                      fit: BoxFit.fill,
                    )),
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
